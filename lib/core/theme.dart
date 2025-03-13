import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
    ),
  );

  static ThemeData darkTheme = ThemeData(
      primaryColor: AppColors.primary,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
      ));
}

class AppColors {
  static const Color primary = Color.fromARGB(255, 74, 8, 167);
  static const Color secondary = Color(0xFF03DAC6);
  static const Color background = Color(0xFFF5F5F5);
  static const Color text = Color(0xFF333333);
  static const Color green = Color.fromARGB(255, 5, 143, 62);
  static const Color lightRose = Color.fromRGBO(231, 152, 152, 1);
  static const Color lightBlue = Color.fromRGBO(186, 220, 255, 1);
}
