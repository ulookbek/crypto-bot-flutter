import 'package:admin/components/custom_dropdown_field.dart';
import 'package:admin/components/custom_text_field.dart';
import 'package:admin/repositories/bot/models/Bot.dart';
import 'package:admin/repositories/bot/bot_repository.dart';
import 'package:flutter/material.dart';

class CreateApiKeyForm extends StatefulWidget {
  @override
  _CreateApiKeyFormState createState() => _CreateApiKeyFormState();
}

class _CreateApiKeyFormState extends State<CreateApiKeyForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
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
          // padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 26),
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Добавление нового API ключа",
                    style: Theme.of(context).textTheme.titleLarge,
                  )),
              Row(
                children: <Widget>[
                  Expanded(
                    child: CustomTextField(
                      hintText: "Название",
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
                      hintText: "API Ключ",
                      controller: _nameController,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      hintText: "Секретный API Ключ",
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
                child: Text('Добавить'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
