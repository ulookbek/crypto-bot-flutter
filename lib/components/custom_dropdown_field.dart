import 'package:admin/config/constants.dart';
import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatelessWidget {
  final T currentValue;
  final List<T> items;
  final String Function(T) getLabel;
  final void Function(T?) onChanged;
  final String hintText;
  final Color fillColor;

  const CustomDropdown({
    Key? key,
    required this.currentValue,
    required this.items,
    required this.getLabel,
    required this.onChanged,
    this.hintText = '',
    this.fillColor = secondaryColor,
  }) : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   return DropdownButton<T>(
  //     value: currentValue,
  //     onChanged: onChanged,
  //     items: items.map<DropdownMenuItem<T>>((T value) {
  //       return DropdownMenuItem<T>(
  //         value: value,
  //         child: Text(getLabel(value)),
  //       );
  //     }).toList(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: InputDecorator(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
          labelText: hintText,
          fillColor: fillColor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<T>(
            value: currentValue,
            isExpanded: true,
            icon: const Icon(Icons.arrow_drop_down),
            onChanged: onChanged,
            items: items.map<DropdownMenuItem<T>>((T value) {
              return DropdownMenuItem<T>(
                value: value,
                child: Text(getLabel(value)),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
