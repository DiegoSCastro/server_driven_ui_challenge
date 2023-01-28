import 'package:flutter/material.dart';

class AppColors {
  static AppColors? _instance;
  AppColors._();

  static AppColors get i {
    _instance ??= AppColors._();
    return _instance!;
  }

  Color get white => const Color(0xFFFFFFFF);
}

extension AppColorsExtensions on BuildContext {
  AppColors get appColors => AppColors.i;
}
