import 'package:flutter/material.dart';

class AppAssets {
  static AppAssets? _instance;
  AppAssets._();

  static AppAssets get i {
    _instance ??= AppAssets._();
    return _instance!;
  }

  String get iconClosedEye => 'assets/images/icon_closed_eye.svg';
}

extension AppAssetsExtensions on BuildContext {
  AppAssets get appAssets => AppAssets.i;
}
