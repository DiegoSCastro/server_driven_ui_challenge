import 'package:flutter/material.dart';

class AppColors {
  static AppColors? _instance;
  AppColors._();

  static AppColors get i {
    _instance ??= AppColors._();
    return _instance!;
  }

  Color get primary => const Color(0xFFD33091);
  Color get secondary => const Color(0xFF2929F5);
  Color get white => const Color(0xFFFFFFFF);
  Color get darkGray => const Color(0xFF4A4A50);
  Color get gray => const Color(0xFFB7B7B9);
  Color get black => const Color(0xFF02020A);

  Color get shadow => const Color.fromRGBO(0, 0, 0, 0.1);
}

extension AppColorsExtensions on BuildContext {
  AppColors get appColors => AppColors.i;
}
