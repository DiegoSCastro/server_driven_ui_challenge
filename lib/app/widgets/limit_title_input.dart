import 'package:flutter/material.dart';
import 'package:sdui/sdui.dart';

class LimitTitleInput extends SDUIWidget {
  String title = '';
  String subtitle = '';
  double paddingTop = 0.0;
  double paddingBottom = 0.0;
  double paddingLeft = 16.0;
  double paddingRight = 16.0;
  double textsSpacing = 24.0;

  @override
  SDUIWidget fromJson(Map<String, dynamic>? json) {
    title = json?['title'] ?? '';
    subtitle = json?['subtitle'] ?? '';
    paddingTop = json?['paddingTop'] ?? 0.0;
    paddingBottom = json?['paddingBottom'] ?? 0.0;
    paddingLeft = json?['paddingLeft'] ?? 16.0;
    paddingRight = json?['paddingRight'] ?? 16.0;
    textsSpacing = json?['textsSpacing'] ?? 24.0;
    return this;
  }

  @override
  Widget toWidget(BuildContext context) {
    // TODO: implement toWidget
    throw UnimplementedError();
  }
}
