import 'package:admin/config/constants.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

final darkTheme = ThemeData.dark().copyWith(
    popupMenuTheme: PopupMenuThemeData(
      color: secondaryColor, // Фоновый цвет
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), // Скругление углов
      ),
      textStyle: TextStyle(
        color: kPrimaryLightColor,
        fontSize: 14, // Уменьшение размера шрифта
      ),
    ),
    scaffoldBackgroundColor: bgColor,
    // textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
    //     .apply(bodyColor: Colors.white),
    canvasColor: secondaryColor,
    primaryColor: kPrimaryColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: const StadiumBorder(),
        // maximumSize: const Size(double.infinity, 56),
        minimumSize: const Size(double.infinity, 56),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: kPrimaryLightColor,
      iconColor: kPrimaryColor,
      prefixIconColor: kPrimaryColor,
      contentPadding: EdgeInsets.symmetric(
          horizontal: defaultPadding, vertical: defaultPadding),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide.none,
      ),
    ));
