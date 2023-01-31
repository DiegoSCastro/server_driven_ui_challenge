import 'package:flutter/material.dart';

class AppColors {
  static AppColors? _instance;
  AppColors._();

  static AppColors get i {
    _instance ??= AppColors._();
    return _instance!;
  }

  Color get white => const Color(0xFFFFFFFF);
  Color get shadow => const Color.fromRGBO(0, 0, 0, 0.1);
  Color get darkGray => const Color(0xFF4A4A50);
  Color get black => const Color(0xFF02020A);
}

extension AppColorsExtensions on BuildContext {
  AppColors get appColors => AppColors.i;
}
