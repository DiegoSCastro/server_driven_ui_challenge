import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:server_driven_ui_challenge/app/core/ui/styles/app_colors.dart';
import 'package:server_driven_ui_challenge/app/core/ui/styles/app_shadows.dart';
import 'package:server_driven_ui_challenge/app/core/ui/styles/app_text_styles.dart';

class MainSectionButton extends StatelessWidget {
  final String label;
  final String description;
  final String icon;
  final Color? iconColor;
  final Color? labelColor;
  const MainSectionButton(
      {Key? key,
      required this.label,
      required this.description,
      required this.icon,
      this.iconColor,
      this.labelColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: context.appColors.white,
        boxShadow: [
          context.appShadows.outerButtonDefault,
        ],
      ),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
              child: SvgPicture.asset(
                'assets/images/$icon.svg',
                color: iconColor,
                width: 26,
                height: 26,
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: context.appTextStyles.titleSmall.copyWith(color: labelColor),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: context.appTextStyles.bodyMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
