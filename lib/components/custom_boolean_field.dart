import 'package:admin/config/constants.dart';
import 'package:flutter/material.dart';

class BooleanField extends StatefulWidget {
  final String label;

  const BooleanField(
      {Key? key, this.label = "" // Значение по умолчанию для метки
      })
      : super(key: key);

  @override
  _BooleanInputFieldState createState() => _BooleanInputFieldState();
}

class _BooleanInputFieldState extends State<BooleanField> {
  bool _value = false; // Начальное значение

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 20.0),
        child: SwitchListTile(
          title: Text(widget.label,
              style: TextStyle(color: kPrimaryLightColor)), // Заголовок
          value: _value,
          onChanged: (bool newValue) {
            setState(() {
              _value = newValue; // Обновление значения
            });
          },
          activeColor: Colors.blue, // Цвет при активации
          tileColor: secondaryColor, // Цвет фона ListTile
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // Закругленные углы
            side: BorderSide.none, // Без рамки
          ),
        ));
  }
}
