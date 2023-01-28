import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sdui/sdui.dart';
import 'package:server_driven_ui_challenge/app/core/ui/styles/app_assets.dart';
import 'package:server_driven_ui_challenge/app/core/ui/styles/app_colors.dart';
import 'package:server_driven_ui_challenge/app/core/ui/styles/app_text_styles.dart';

import '../core/ui/clip/clip_oval_app_bar_bottom.dart';

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

  bool visible = true;
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Saldo Disponível',
                  style: context.appTextStyles.headlineLarge.copyWith(
                    color: context.appColors.white,
                  ),
                ),
                const EyeIcon()
              ],
            ),
            const SizedBox(height: 24),
            Row()
          ],
        ),
      ),
    );
  }
}

class EyeIcon extends StatefulWidget {
  const EyeIcon({super.key});

  @override
  State<EyeIcon> createState() => _EyeIconState();
}

class _EyeIconState extends State<EyeIcon> {
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          visible = !visible;
        });
      },
      child: visible
          ? SvgPicture.asset(context.appAssets.iconClosedEye)
          : Icon(
              Icons.visibility,
              color: context.appColors.white,
            ),
    );
  }
}
