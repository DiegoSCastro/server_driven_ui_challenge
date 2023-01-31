import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sdui/sdui.dart';
import 'package:server_driven_ui_challenge/app/core/ui/styles/app_colors.dart';
import 'package:server_driven_ui_challenge/app/core/ui/styles/app_shadows.dart';
import 'package:server_driven_ui_challenge/app/core/ui/styles/app_text_styles.dart';

class SectionIconButton extends SDUIWidget {
  String label = '';
  String icon = '';
  String iconColor = '';
  String labelColor = '#4A4A50';

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
    return Expanded(
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: context.appColors.white,
          boxShadow: [
            context.appShadows.outerButtonDefault,
          ],
        ),
        child: InkWell(
          onTap: () {},
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/images/$icon.svg',
                color: toColor(iconColor),
                width: 20,
                height: 20,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  label,
                  maxLines: 2,
                  style: context.appTextStyles.bodyMedium.copyWith(
                    color: toColor(labelColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
