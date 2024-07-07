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
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
              color: Pallete.cardBorderColor,
            )),
        color: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      scaffoldBackgroundColor: Pallete.whiteColor,
      inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Pallete.whiteColor,
          contentPadding: const EdgeInsets.all(20),
          enabledBorder: _border(Pallete.greyColor),
          focusedBorder: _border(Pallete.color1),
          errorBorder: _border(Pallete.errorColor)),
      colorScheme: ColorScheme.fromSeed(seedColor: Pallete.color1));
}
