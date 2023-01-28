import 'package:flutter/material.dart';

class AppTextStyles {
  static AppTextStyles? _instance;
  AppTextStyles._();

  static AppTextStyles get i {
    _instance ??= AppTextStyles._();
    return _instance!;
  }

  String get primaryFont => 'Poppins';

  TextStyle get headlineLarge => TextStyle(
        fontSize: 23,
        height: 1.17,
        fontWeight: FontWeight.w700,
        fontFamily: primaryFont,
      );

  TextStyle get bodyMedium => TextStyle(
        fontWeight: FontWeight.normal,
        fontFamily: primaryFont,
      );
}

extension AppTextStylesExtensions on BuildContext {
  AppTextStyles get appTextStyles => AppTextStyles.i;
}
