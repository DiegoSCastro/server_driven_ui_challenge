import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sdui/sdui.dart';
import 'package:server_driven_ui_challenge/app/core/ui/styles/app_colors.dart';
import 'package:server_driven_ui_challenge/app/core/ui/styles/app_shadows.dart';
import 'package:server_driven_ui_challenge/app/core/ui/styles/app_text_styles.dart';

class CustomTextIconButton extends SDUIWidget {
  String label = '';
  String icon = 'arrow_right';
  String iconColor = '#4A4A50';
  String labelColor = '#4A4A50';
  ActionCallback? onPressed;

  @override
  SDUIWidget fromJson(Map<String, dynamic>? json) {
    label = json?['label'] ?? '';
    icon = json?['icon'] ?? '';
    iconColor = json?['iconColor'] ?? '#4A4A50';
    labelColor = json?['labelColor'] ?? '#4A4A50';
    return this;
  }

  @override
  Widget toWidget(BuildContext context) {
    Future<String?> onSubmit(BuildContext context) => onPressed == null
        ? action.execute(context, null).then((value) => action.handleResult(context, value))
        : onPressed!(context);

    return Container(
      height: 36,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: context.appColors.white,
        boxShadow: [
          context.appShadows.outerButtonDefault,
        ],
      ),
      child: InkWell(
        onTap: () => onSubmit(context),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                maxLines: 2,
                style: context.appTextStyles.titleSmall.copyWith(
                  color: toColor(labelColor),
                ),
              ),
            ),
            const SizedBox(width: 8),
            SvgPicture.asset(
              'assets/images/$icon.svg',
              color: toColor(iconColor),
              width: 12,
              height: 12,
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
