import 'package:admin/config/constants.dart';
import 'package:admin/config/responsive.dart';
import 'package:admin/features/api_key/bloc/api_key_bloc.dart';
import 'package:admin/features/api_key/view/api_key_add_screen.dart';
import 'package:admin/features/menu/bloc/menu_bloc.dart';
import 'package:admin/repositories/api_key/models/ApiKey.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ActionType { modify, delete, start, detail }

class MyApiKeysTable extends StatefulWidget {
  const MyApiKeysTable({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApiKeysTable> createState() => _MyApiKeysTableState();
}

class _MyApiKeysTableState extends State<MyApiKeysTable> {
  List<DataColumn> getColumns() {
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
        label: Text("Действие"),
      ),
    ];
  }

  final _apiKeysList = ApiKeyBloc();

  @override
  void initState() {
    _apiKeysList.add(LoadApiKeysList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApiKeyBloc, ApiKeyState>(
        bloc: _apiKeysList,
        builder: (context, state) {
          if (state is ApiKeyLoaded) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Мои API ключи",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        // maximumSize: const Size(300, 56),
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
                            .add(SetCurrentPageEvent(CreateApiKeyScreen()));
                      },
                      icon: Icon(Icons.add),
                      label: Text("Добавить новый  API ключ"),
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
                          columns: getColumns(),
                          rows: List.generate(
                            state.apiKeysList.length,
                            (index) {
                              final apiKey = state.apiKeysList.toList()[index];
                              return botsDataRow(
                                  apiKey, Responsive.isMobile(context));
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

DataRow botsDataRow(ApiKeyEntity fileInfo, bool isMobile) {
  return DataRow(
    cells: [
      DataCell(Text(fileInfo.id)),
      DataCell(Text(fileInfo.name)),
      DataCell(Text(formatDateTime(fileInfo.createdAt))),
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
