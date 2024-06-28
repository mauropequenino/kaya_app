import 'package:flutter/material.dart';
import 'package:kaya_app/core/theme/app_pallete.dart';


class AppTheme {
  static _border(Color color) => OutlineInputBorder(
        borderSide: BorderSide(color: color, width: 1),
        borderRadius: BorderRadius.circular(10),
      );
  static final darkThemeMode = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Pallete.darkkBackgroundColor,
      inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(20),
          enabledBorder: _border(Pallete.borderColor),
          focusedBorder: _border(Pallete.color1)));

  static final lightThemeMode = ThemeData.light().copyWith(
      scaffoldBackgroundColor: Pallete.whiteColor,
      inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Pallete.whiteColor,
          contentPadding: const EdgeInsets.all(20),
          enabledBorder: _border(Pallete.greyColor),
          focusedBorder: _border(Pallete.color1),
          errorBorder: _border(Pallete.errorColor)));
}
