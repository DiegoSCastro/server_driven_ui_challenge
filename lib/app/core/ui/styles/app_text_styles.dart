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
  TextStyle get headlineSmall => TextStyle(
        fontSize: 20,
        height: 1.33,
        fontWeight: FontWeight.w600,
        fontFamily: primaryFont,
      );
  TextStyle get titleSmall => TextStyle(
        fontSize: 12,
        height: 1.66,
        fontWeight: FontWeight.w700,
        fontFamily: primaryFont,
      );

  TextStyle get bodyMedium => TextStyle(
        fontWeight: FontWeight.normal,
        fontFamily: primaryFont,
        fontSize: 11,
        height: 1.27,
      );
  TextStyle get bodyLarge => TextStyle(
        fontWeight: FontWeight.normal,
        fontFamily: primaryFont,
        fontSize: 15,
        height: 1.53,
      );
}

extension AppTextStylesExtensions on BuildContext {
  AppTextStyles get appTextStyles => AppTextStyles.i;
}
