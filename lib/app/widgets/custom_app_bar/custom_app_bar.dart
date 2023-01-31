import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sdui/sdui.dart';

import '../../core/ui/clip/clip_oval_app_bar_bottom.dart';
import '../../core/ui/styles/app_styles.dart';
import 'components/balance_visible.dart';

class CustomAppBar extends SDUIWidget {
  double? height;
  double? topPadding;
  double? bottomPadding;
  double? horizontalPadding = 16;
  bool curved = true;
  String? gradientTopColor = '#D33091';
  String? gradientBottomColor = '#FF5CBD';
  String? box1Label;
  String? box2Label;
  String? box1Value;
  String? box2Value;
  bool showBox1 = true;
  bool showBox2 = true;

  @override
  SDUIWidget fromJson(Map<String, dynamic>? json) {
    height = json?['height'] ?? 0;
    topPadding = json?['topPadding'] ?? 0;
    bottomPadding = json?['bottomPadding'] ?? 0;
    horizontalPadding = json?['horizontalPadding'] ?? 16;
    curved = json?['curved'] ?? true;
    gradientTopColor = json?['gradientTopColor'] ?? '#D33091';
    gradientBottomColor = json?['gradientBottomColor'] ?? '#FF5CBD';
    box1Label = json?['box1Label'] ?? '';
    box2Label = json?['box2Label'] ?? '';
    box1Value = json?['box1Value'] ?? '';
    box2Value = json?['box2Value'] ?? '';

    showBox1 = json?['showBox1'] ?? true;
    showBox2 = json?['showBox2'] ?? true;
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
            AppBarContent(
              box1Label: box1Label,
              box1Value: box1Value,
              showBox1: showBox1,
              box2Label: box2Label,
              box2Value: box2Value,
              showBox2: showBox2,
            ),
          ],
        ),
      ),
    );
  }
}

class AppBarContent extends StatefulWidget {
  final String? box1Label;
  final String? box2Label;
  final String? box1Value;
  final String? box2Value;
  final bool showBox1;
  final bool showBox2;
  const AppBarContent({
    super.key,
    this.box1Label,
    this.box2Label,
    this.box1Value,
    this.box2Value,
    this.showBox1 = true,
    this.showBox2 = true,
  });

  @override
  State<AppBarContent> createState() => _AppBarContentState();
}

class _AppBarContentState extends State<AppBarContent> {
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return Column(
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
            InkWell(
              onTap: () {
                setState(() {
                  visible = !visible;
                });
              },
              child: visible
                  ? Icon(
                      Icons.visibility,
                      color: context.appColors.white,
                    )
                  : SvgPicture.asset(context.appAssets.iconClosedEye),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            if (widget.showBox1)
              BalanceVisible(
                label: widget.box1Label ?? '',
                amount: widget.box1Value ?? '',
                visible: visible,
              ),
            if (widget.showBox2)
              BalanceVisible(
                label: widget.box2Label ?? '',
                amount: widget.box2Value ?? '',
                visible: visible,
              ),
          ],
        )
      ],
    );
  }
}
