
import 'package:admin/components/custom_dropdown_field.dart';
import 'package:admin/components/custom_text_field.dart';
import 'package:admin/repositories/bot/models/Bot.dart';
import 'package:admin/repositories/bot/bot_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateBotStepForm extends StatefulWidget {
  @override
  _CreateBotStepFormState createState() => _CreateBotStepFormState();
}

class _CreateBotStepFormState extends State<CreateBotStepForm> {
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1),
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
                    child: CustomDropdown<ExchangeType>(
                      hintText: "Биржа",
                      currentValue: ExchangeType.Binance,
                      items: ExchangeType.values,
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
                children: [
                  Expanded(
                    child: CustomTextField(
                      hintText: "Название Бота",
                      controller: _nameController,
                    ),
                  ),
                ],
              ),
              
              ElevatedButton(
                onPressed: () {
                  BotRepository().getBotsList();
                  if (_formKey.currentState!.validate()) {
                    // Обработка данных формы
                  }
                },
                child: Text('Создать'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AdditionalForm extends StatefulWidget {
  final nameController;
  const AdditionalForm({
    Key? key,
    required this.nameController,
  }) : super(key: key);

  @override
  State<AdditionalForm> createState() => _AdditionalFormState();
}

class _AdditionalFormState extends State<AdditionalForm> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: CustomTextField(
            hintText: "ASD",
            controller: widget.nameController,
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: CustomTextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ],
                hintText: "Сумма для торговли",
                controller: widget.nameController,
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
                getLabel: (exchange) => exchange.toString().split('.').last,
                onChanged: (newValue) {
                  if (newValue != null) {
                    // Обновить состояние или выполнить другие действия
                  }
                },
              ),
            ),
          ],
        ),
        // Row(
        //   children: <Widget>[
        //     Expanded(
        //       child: CustomTextField(
        //         keyboardType: TextInputType.numberWithOptions(decimal: true),
        //         inputFormatters: [
        //           FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
        //         ],
        //         hintText: "Длина сетки страховочных ордеров (%).",
        //         controller: widget.nameController,
        //         validator: (value) {
        //           if (value == null || value.isEmpty) {
        //             return 'Пожалуйста, введите число';
        //           }
        //           final n = double.tryParse(value);
        //           if (n == null) {
        //             return '"$value" не является допустимым числом';
        //           }
        //           print("object: $value");
        //           return null; // если ошибок нет
        //         },
        //       ),
        //     ),
        //     SizedBox(width: 8),
        //     Expanded(
        //       child: CustomTextField(
        //         keyboardType: TextInputType.numberWithOptions(decimal: true),
        //         inputFormatters: [
        //           FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
        //         ],
        //         hintText: "Отступ первого ордера (%).",
        //         controller: widget.nameController,
        //         validator: (value) {
        //           if (value == null || value.isEmpty) {
        //             return 'Пожалуйста, введите число';
        //           }
        //           final n = double.tryParse(value);
        //           if (n == null) {
        //             return '"$value" не является допустимым числом';
        //           }
        //           print("object: $value");
        //           return null; // если ошибок нет
        //         },
        //       ),
        //     ),
        //   ],
        // ),
        // Row(
        //   children: <Widget>[
        //     Expanded(
        //       child: CustomTextField(
        //         keyboardType: TextInputType.number,
        //         inputFormatters: [
        //           FilteringTextInputFormatter.digitsOnly,
        //         ],
        //         hintText: "Количество страховочных ордеров на покупку",
        //         controller: widget.nameController,
        //         validator: (value) {
        //           if (value == null || value.isEmpty) {
        //             return 'Пожалуйста, введите число';
        //           }
        //           print("object: $value");
        //           return null; // если ошибок нет
        //         },
        //       ),
        //     ),
        //     SizedBox(width: 8),
        //     Expanded(
        //       child: CustomTextField(
        //         keyboardType: TextInputType.number,
        //         inputFormatters: [
        //           FilteringTextInputFormatter.digitsOnly,
        //         ],
        //         hintText: "Количество частично выставленных ордеров",
        //         controller: widget.nameController,
        //         validator: (value) {
        //           if (value == null || value.isEmpty) {
        //             return 'Пожалуйста, введите число';
        //           }
        //           print("object: $value");
        //           return null; // если ошибок нет
        //         },
        //       ),
        //     ),
        //   ],
        // ),
        // Row(
        //   children: <Widget>[
        //     Expanded(
        //       child: CustomTextField(
        //         keyboardType: TextInputType.numberWithOptions(decimal: true),
        //         inputFormatters: [
        //           FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
        //         ],
        //         hintText:
        //             "Процент увеличения суммы каждого последующего страховочного ордера (мартингейл)",
        //         controller: widget.nameController,
        //         validator: (value) {
        //           if (value == null || value.isEmpty) {
        //             return 'Пожалуйста, введите число';
        //           }
        //           print("object: $value");
        //           return null; // если ошибок нет
        //         },
        //       ),
        //     ),
        //     SizedBox(width: 8),
        //     Expanded(
        //       child: CustomTextField(
        //         keyboardType: TextInputType.numberWithOptions(decimal: true),
        //         inputFormatters: [
        //           FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
        //         ],
        //         hintText: "Желаемый процент прибыли",
        //         controller: widget.nameController,
        //         validator: (value) {
        //           if (value == null || value.isEmpty) {
        //             return 'Пожалуйста, введите число';
        //           }
        //           print("object: $value");
        //           return null; // если ошибок нет
        //         },
        //       ),
        //     ),
        //   ],
        // ),
        // Row(
        //   children: <Widget>[
        //     Expanded(
        //       child: CustomTextField(
        //         keyboardType: TextInputType.numberWithOptions(decimal: true),
        //         inputFormatters: [
        //           FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
        //         ],
        //         hintText: "Процент изменения цены для обновления сетки",
        //         controller: widget.nameController,
        //         validator: (value) {
        //           if (value == null || value.isEmpty) {
        //             return 'Пожалуйста, введите число';
        //           }
        //           print("object: $value");
        //           return null; // если ошибок нет
        //         },
        //       ),
        //     ),
        //     SizedBox(width: 8),
        //     Expanded(
        //       child: CustomTextField(
        //         keyboardType: TextInputType.numberWithOptions(decimal: true),
        //         inputFormatters: [
        //           FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
        //         ],
        //         hintText: "Коэффициент для расчета логарифмической сетки",
        //         controller: widget.nameController,
        //         validator: (value) {
        //           if (value == null || value.isEmpty) {
        //             return 'Пожалуйста, введите число';
        //           }
        //           print("object: $value");
        //           return null; // если ошибок нет
        //         },
        //       ),
        //     ),
        //   ],
        // ),
        // Row(
        //   children: <Widget>[
        //     Expanded(
        //       child: CustomTextField(
        //         keyboardType: TextInputType.numberWithOptions(decimal: true),
        //         inputFormatters: [
        //           FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
        //         ],
        //         hintText: "Капитализация прибыли",
        //         controller: widget.nameController,
        //         validator: (value) {
        //           if (value == null || value.isEmpty) {
        //             return 'Пожалуйста, введите число';
        //           }
        //           print("object: $value");
        //           return null; // если ошибок нет
        //         },
        //       ),
        //     ),
        //     SizedBox(width: 8),
        //     Expanded(
        //       child: CustomTextField(
        //         keyboardType: TextInputType.numberWithOptions(decimal: true),
        //         inputFormatters: [
        //           FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
        //         ],
        //         hintText: "Верхняя граница цены",
        //         controller: widget.nameController,
        //         validator: (value) {
        //           if (value == null || value.isEmpty) {
        //             return 'Пожалуйста, введите число';
        //           }
        //           print("object: $value");
        //           return null; // если ошибок нет
        //         },
        //       ),
        //     ),
        //   ],
        // ),
        // Row(
        //   children: <Widget>[
        //     Expanded(
        //       child: CustomDropdown<BotStatusType>(
        //         hintText: "Статус бота",
        //         currentValue: BotStatusType.Active,
        //         items: BotStatusType.values,
        //         getLabel: (exchange) => exchange.toString().split('.').last,
        //         onChanged: (newValue) {
        //           if (newValue != null) {
        //             // Обновить состояние или выполнить другие действия
        //           }
        //         },
        //       ),
        //     ),
        //     SizedBox(width: 8),
        //     Expanded(
        //       child: BooleanField(
        //         label: "Активен",
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
