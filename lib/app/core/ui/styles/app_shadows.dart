import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppShadows {
  static AppShadows? _instance;
  AppShadows._();

  static AppShadows get i {
    _instance ??= AppShadows._();
    return _instance!;
  }

  BoxShadow get outerButtonDefault => BoxShadow(
        color: AppColors.i.shadow,
        spreadRadius: 0,
        blurRadius: 3,
        offset: const Offset(0, 1),
      );
}

extension AppShadowsExtensions on BuildContext {
  AppShadows get appShadows => AppShadows.i;
}
