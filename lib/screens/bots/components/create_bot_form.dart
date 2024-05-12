import 'package:admin/components/custom_boolean_field.dart';
import 'package:admin/components/custom_dropdown_field.dart';
import 'package:admin/components/custom_text_field.dart';
import 'package:admin/features/api_key/view/api_key_add_screen.dart';
import 'package:admin/features/api_key/widgets/api_key_dropdown.dart';
import 'package:admin/features/bot/view/bots_list_screen.dart';
import 'package:admin/features/menu/bloc/menu_bloc.dart';
import 'package:admin/repositories/bot/models/Bot.dart';
import 'package:admin/repositories/bot/bot_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateBotForm extends StatefulWidget {
  @override
  _CreateBotFormState createState() => _CreateBotFormState();
}

class _CreateBotFormState extends State<CreateBotForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _gridLengthController = TextEditingController();
  final TextEditingController _firstOrderOffsetController =
      TextEditingController();
  final TextEditingController _numOrdersController = TextEditingController();
  final TextEditingController _partialNumOrdersController =
      TextEditingController();
  final TextEditingController _nextOrderVolumeController =
      TextEditingController();
  final TextEditingController _profitPercentageController =
      TextEditingController();
  final TextEditingController _priceChangePercentageController =
      TextEditingController();
  final TextEditingController _logCoefficientController =
      TextEditingController();
  final TextEditingController _profitCapitalizationController =
      TextEditingController();
  final TextEditingController _upperPriceLimitController =
      TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    _gridLengthController.dispose();
    _firstOrderOffsetController.dispose();
    _numOrdersController.dispose();
    _partialNumOrdersController.dispose();
    _nextOrderVolumeController.dispose();
    _profitPercentageController.dispose();
    _priceChangePercentageController.dispose();
    _logCoefficientController.dispose();
    _profitCapitalizationController.dispose();
    _upperPriceLimitController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final BotEntity bot = BotEntity(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: _nameController.text,
        exchange: ExchangeType.Binance,
        symbol: SymbolType.BTC_USDT,
        amount: 99,
        status: BotStatusType.Active,
        isActive: true,
        createdAt: DateTime(2011),
      );

      Response<dynamic> res = await BotRepository().createBot(bot: bot);
      if (res.statusCode! > 199 && res.statusCode! < 300) {
        showNotification(context, "Успешно создано!");
        context.read<MenuBloc>().add(SetCurrentPageEvent(BotsListScreen()));
      }
      print(res);
    }
  }

  void showNotification(BuildContext context, String message) {
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 50.0, // Позиция от верха
        right: 10, // Центрирование по горизонтали
        width: MediaQuery.of(context).size.width * 0.8, // Ширина уведомления
        child: Material(
          color: Color.fromARGB(255, 96, 255, 38),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 96, 255, 38),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );
    Overlay.of(context)?.insert(overlayEntry);
    Future.delayed(Duration(seconds: 3), () => overlayEntry.remove());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Создание нового бота",
                    style: Theme.of(context).textTheme.titleLarge,
                  )),
              Row(
                children: <Widget>[
                  Expanded(
                    child: CustomTextField(
                      hintText: "Название Бота",
                      controller: _nameController,
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: CustomDropdown<ExchangeType>(
                      hintText: "Биржа",
                      currentValue: ExchangeType.Binance,
                      items: ExchangeType.values,
                      getLabel: (exchange) =>
                          exchange.toString().split('.').last,
                      onChanged: (newValue) {
                        if (newValue != null) {}
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  ApiKeyDropdown(onChanged: () {}),
                  TextButton(
                    onPressed: () {
                      context
                          .read<MenuBloc>()
                          .add(SetCurrentPageEvent(CreateApiKeyScreen()));
                    },
                    child: Text(
                      "Добавить новый API ключ",
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: CustomTextField(
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d*\.?\d*')),
                      ],
                      hintText: "Сумма для торговли",
                      controller: _amountController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Пожалуйста, введите число';
                        }
                        final n = double.tryParse(value);
                        if (n == null) {
                          return '"$value" не является допустимым числом';
                        }
                        return null; // если ошибок нет
                      },
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: CustomDropdown<SymbolType>(
                      hintText: "Торговая пара",
                      currentValue: SymbolType.BTC_USDT,
                      items: SymbolType.values,
                      getLabel: (exchange) =>
                          exchange.toString().split('.').last,
                      onChanged: (newValue) {
                        if (newValue != null) {
                          // Обновить состояние или выполнить другие действия
                        }
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: CustomTextField(
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d*\.?\d*')),
                      ],
                      hintText: "Длина сетки страховочных ордеров (%).",
                      controller: _gridLengthController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Пожалуйста, введите число';
                        }
                        final n = double.tryParse(value);
                        if (n == null) {
                          return '"$value" не является допустимым числом';
                        }
                        return null; // если ошибок нет
                      },
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: CustomTextField(
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d*\.?\d*')),
                      ],
                      hintText: "Отступ первого ордера (%).",
                      controller: _firstOrderOffsetController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Пожалуйста, введите число';
                        }
                        final n = double.tryParse(value);
                        if (n == null) {
                          return '"$value" не является допустимым числом';
                        }
                        return null; // если ошибок нет
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: CustomTextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      hintText: "Количество страховочных ордеров на покупку",
                      controller: _numOrdersController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Пожалуйста, введите число';
                        }
                        return null; // если ошибок нет
                      },
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: CustomTextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      hintText: "Количество частично выставленных ордеров",
                      controller: _partialNumOrdersController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Пожалуйста, введите число';
                        }
                        return null; // если ошибок нет
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: CustomTextField(
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d*\.?\d*')),
                      ],
                      hintText:
                          "Процент увеличения суммы каждого последующего страховочного ордера (мартингейл)",
                      controller: _nextOrderVolumeController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Пожалуйста, введите число';
                        }
                        return null; // если ошибок нет
                      },
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: CustomTextField(
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d*\.?\d*')),
                      ],
                      hintText: "Желаемый процент прибыли",
                      controller: _profitPercentageController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Пожалуйста, введите число';
                        }
                        return null; // если ошибок нет
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: CustomTextField(
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d*\.?\d*')),
                      ],
                      hintText: "Процент изменения цены для обновления сетки",
                      controller: _priceChangePercentageController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Пожалуйста, введите число';
                        }
                        return null; // если ошибок нет
                      },
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: CustomTextField(
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d*\.?\d*')),
                      ],
                      hintText: "Коэффициент для расчета логарифмической сетки",
                      controller: _logCoefficientController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Пожалуйста, введите число';
                        }
                        return null; // если ошибок нет
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: CustomTextField(
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d*\.?\d*')),
                      ],
                      hintText: "Капитализация прибыли",
                      controller: _profitCapitalizationController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Пожалуйста, введите число';
                        }
                        return null; // если ошибок нет
                      },
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: CustomTextField(
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d*\.?\d*')),
                      ],
                      hintText: "Верхняя граница цены",
                      controller: _upperPriceLimitController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Пожалуйста, введите число';
                        }
                        return null; // если ошибок нет
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: CustomDropdown<BotStatusType>(
                      hintText: "Статус бота",
                      currentValue: BotStatusType.Active,
                      items: BotStatusType.values,
                      getLabel: (exchange) =>
                          exchange.toString().split('.').last,
                      onChanged: (newValue) {
                        if (newValue != null) {
                          // Обновить состояние или выполнить другие действия
                        }
                      },
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: BooleanField(
                      label: "Активен",
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Создать'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
