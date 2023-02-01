import 'package:flutter/cupertino.dart';
import 'package:sdui/sdui.dart';

import '../../../core/ui/styles/app_styles.dart';

class TransactionLimitTitle extends SDUIWidget {
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
    return Padding(
      padding: EdgeInsets.only(
        top: paddingTop,
        right: paddingRight,
        left: paddingLeft,
        bottom: paddingBottom,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.appTextStyles.headlineLarge,
          ),
          SizedBox(height: textsSpacing),
          Text(
            subtitle,
            style: context.appTextStyles.titleSmall.copyWith(
              color: context.appColors.darkGray,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
