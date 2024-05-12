import 'package:admin/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String? iconName;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter> inputFormatters;

  const CustomTextField(
      {Key? key,
      required this.hintText,
      this.iconName,
      required this.controller,
      this.validator,
      this.keyboardType = TextInputType.text,
      this.inputFormatters = const []})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 20.0),
        child: TextFormField(
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          controller: controller,
          decoration: _getInputDecoration(context),
          validator: validator,
        ));
  }

  InputDecoration _getInputDecoration(BuildContext context) {
    return InputDecoration(
      labelText: hintText,
      hintText: hintText,
      fillColor: secondaryColor,
      filled: true,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      suffixIcon: iconName != null ? _buildIcon(context) : null,
    );
  }

  Widget _buildIcon(BuildContext context) {
    return InkWell(
      onTap: () {
        // Действие при нажатии на иконку (если требуется)
      },
      child: Container(
        padding: const EdgeInsets.all(12), // Замените на ваш defaultPadding
        margin: const EdgeInsets.symmetric(horizontal: 12), // И тут
        decoration: BoxDecoration(
          color: Colors.blue, // Замените на ваш primaryColor
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: SvgPicture.asset("assets/icons/$iconName.svg"),
      ),
    );
  }
}
