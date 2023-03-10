import 'package:flutter/material.dart';
import 'package:sdui/sdui.dart';

import '../../../../core/ui/styles/app_styles.dart';
import 'components/main_section_buttom.dart';

class PaymentSection extends SDUIWidget {
  String title = '';
  double horizontalPadding = 0.0;
  double verticalPadding = 0.0;
  String mainLabel = '';
  String mainDescription = '';
  String mainIcon = '';
  String mainIconColor = '';
  String mainLabelColor = '';

  @override
  SDUIWidget fromJson(Map<String, dynamic>? json) {
    title = json?['title'] ?? '';
    horizontalPadding = json?['horizontalPadding'] ?? 10.0;
    verticalPadding = json?['verticalPadding'] ?? 10.0;
    mainLabel = json?['mainLabel'] ?? '';
    mainDescription = json?['mainDescription'] ?? '';
    mainIcon = json?['mainIcon'] ?? '';
    mainIconColor = json?['mainIconColor'] ?? '';
    mainLabelColor = json?['mainLabelColor'] ?? '';

    return this;
  }

  @override
  Widget toWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.appTextStyles.headlineSmall,
          ),
          const SizedBox(height: 8),
          MainSectionButton(
            label: mainLabel,
            description: mainDescription,
            icon: mainIcon,
            iconColor: toColor(mainIconColor),
            labelColor: toColor(mainLabelColor),
          ),
          const SizedBox(height: 16),
          Row(
            children: childrenWidgets(context),
          )
        ],
      ),
    );
  }
}
