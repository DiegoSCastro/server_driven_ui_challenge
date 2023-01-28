import 'package:flutter/material.dart';
import 'package:sdui/sdui.dart';

import '../core/ui/custom_clip/ClipOvalAppBarBottom.dart';

class CustomAppBar extends SDUIWidget {
  double? height;
  double? topPadding;
  double? bottomPadding;
  double? horizontalPadding = 16;
  bool curved = true;
  String? gradientTopColor = '#D33091';
  String? gradientBottomColor = '#FF5CBD';

  @override
  SDUIWidget fromJson(Map<String, dynamic>? json) {
    height = json?['height'] ?? 0;
    topPadding = json?['topPadding'] ?? 0;
    bottomPadding = json?['bottomPadding'] ?? 0;
    horizontalPadding = json?['horizontalPadding'] ?? 16;
    curved = json?['curved'] ?? true;
    gradientTopColor = json?['gradientTopColor'] ?? '#D33091';
    gradientBottomColor = json?['gradientBottomColor'] ?? '#FF5CBD';
    return this;
  }

  @override
  Widget toWidget(BuildContext context) {
    return ClipPath(
      clipper: curved ? ClipOvalAppBarBottom() : null,
      child: Container(
        padding: EdgeInsets.only(
          right: horizontalPadding ?? 0,
          left: horizontalPadding ?? 0,
          top: topPadding ?? 0,
          bottom: bottomPadding ?? 0,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              toColor(gradientTopColor) ?? Colors.white,
              toColor(gradientBottomColor) ?? Colors.white,
            ],
          ),
        ),
        height: height,
        width: double.infinity,
        child: Column(
          children: [
            Text(
              'Saldo Disponível',
            ),
          ],
        ),
      ),
    );
  }
}
