import 'package:admin/config/constants.dart';
import 'package:admin/config/responsive.dart';
import 'package:admin/features/bot/bloc/bot_bloc.dart';
import 'package:admin/features/bot/widgets/add_bot_screen.dart';
import 'package:admin/features/menu/bloc/menu_bloc.dart';
import 'package:admin/repositories/bot/bot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ActionType { modify, delete, start, detail }

class MyBots extends StatefulWidget {
  const MyBots({
    Key? key,
  }) : super(key: key);

  @override
  State<MyBots> createState() => _MyBotsState();
}

class _MyBotsState extends State<MyBots> {
  List<DataColumn> getColumns(bool isMobile) {
    if (isMobile) {
      return [
        DataColumn(
          label: Text("ID"),
        ),
        DataColumn(
          label: Text("Название"),
        ),
        DataColumn(
          label: Text("Действие"),
        ),
      ];
    }
    return [
      DataColumn(
        label: Text("ID"),
      ),
      DataColumn(
        label: Text("Название"),
      ),
      DataColumn(
        label: Text("Дата создания"),
      ),
      DataColumn(
        label: Text("Биржа"),
      ),
      DataColumn(
        label: Text("Торговая пара"),
      ),
      DataColumn(
        label: Text("Сумма"),
      ),
      DataColumn(
        label: Text("Статус"),
      ),
      DataColumn(
        label: Text("Активность"),
      ),
      DataColumn(
        label: Text("Действие"),
      ),
    ];
  }

  final _botsList = BotBloc();

  @override
  void initState() {
    _botsList.add(LoadBotsList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BotBloc, BotsState>(
        bloc: _botsList,
        builder: (context, state) {
          if (state is BotsLoaded) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Мои боты",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(250, 56),
                        padding: EdgeInsets.symmetric(
                          horizontal: defaultPadding * 1.5,
                          vertical: defaultPadding /
                              (Responsive.isMobile(context) ? 2 : 1),
                        ),
                      ),
                      onPressed: () {
                        context
                            .read<MenuBloc>()
                            .add(SetCurrentPageEvent(AddBotScreen()));
                      },
                      icon: Icon(Icons.add),
                      label: Text("Создать бота"),
                    ),
                  ],
                ),
                SizedBox(
                  height: defaultPadding,
                ),
                Container(
                  padding: EdgeInsets.all(defaultPadding),
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: DataTable(
                          columnSpacing: defaultPadding,
                          // minWidth: 600,
                          columns: getColumns(Responsive.isMobile(context)),
                          rows: Responsive.isMobile(context)
                              ? List.generate(
                                  state.botsList.length,
                                  (index) => botsDataRow(state.botsList[index],
                                      Responsive.isMobile(context)),
                                )
                              : List.generate(
                                  state.botsList.length,
                                  (index) {
                                    final bot = state.botsList.toList()[index];
                                    return botsDataRow(
                                        bot, Responsive.isMobile(context));
                                  },
                                ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          } else {
            return Text("Загрузка...");
          }
        });
  }
}

DataRow botsDataRow(BotEntity fileInfo, bool isMobile) {
  if (isMobile) {
    return DataRow(
      cells: [
        DataCell(Text(fileInfo.id)),
        DataCell(Text(fileInfo.name)),
        DataCell(tableDropdown()),

        // DataCell(Text(fileInfo.isActive ? "Активный" : "Не активный")),
      ],
    );
  }
  return DataRow(
    cells: [
      DataCell(Text(fileInfo.id)),
      DataCell(Text(fileInfo.name)),
      DataCell(Text(formatDateTime(fileInfo.createdAt))),
      DataCell(Text(fileInfo.exchange.name)),
      DataCell(Text(fileInfo.symbol.name)),
      DataCell(Text(fileInfo.amount.toString())),
      DataCell(Text(fileInfo.status.name)),
      DataCell(Text(fileInfo.isActive ? "Активный" : "Не активный")),
      DataCell(tableDropdown()),
    ],
  );
}

Widget tableDropdown() {
  return PopupMenuButton<ActionType>(
    onSelected: (ActionType result) {
      switch (result) {
        case ActionType.modify:
          // Логика для "Изменить"
          print('Modify action selected');
          break;
        case ActionType.delete:
          // Логика для "Удалить"
          print('Delete action selected');
          break;
        case ActionType.start:
          // Логика для "Запустить"
          print('Start action selected');
          break;
        case ActionType.detail:
          // Логика для "Детально"
          print('Detail action selected');
          break;
      }
    },
    itemBuilder: (BuildContext context) => <PopupMenuEntry<ActionType>>[
      const PopupMenuItem<ActionType>(
        value: ActionType.modify,
        child: Text('Изменить'),
      ),
      const PopupMenuItem<ActionType>(
        value: ActionType.delete,
        child: Text('Удалить'),
      ),
      const PopupMenuItem<ActionType>(
        value: ActionType.start,
        child: Text('Запустить'),
      ),
      const PopupMenuItem<ActionType>(
        value: ActionType.detail,
        child: Text('Детально'),
      ),
    ],
    icon: Icon(Icons.more_vert), // Иконка для кнопки dropdown
  );
}

String formatDateTime(DateTime dateTime) {
  // Получение компонентов даты
  int year = dateTime.year;
  int month = dateTime.month;
  int day = dateTime.day;
  int hour = dateTime.hour;
  int minute = dateTime.minute;

  // Форматирование с ведущими нулями для месяца, дня, часа и минут
  String formattedMonth = month.toString().padLeft(2, '0');
  String formattedDay = day.toString().padLeft(2, '0');
  String formattedHour = hour.toString().padLeft(2, '0');
  String formattedMinute = minute.toString().padLeft(2, '0');

  // Сборка конечной строки даты и времени
  return '$year/$formattedMonth/$formattedDay $formattedHour:$formattedMinute';
}
