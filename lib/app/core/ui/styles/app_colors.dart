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
}

extension AppColorsExtensions on BuildContext {
  AppColors get appColors => AppColors.i;
}
