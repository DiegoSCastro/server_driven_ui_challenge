import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sdui/sdui.dart';
import 'package:server_driven_ui_challenge/app/core/ui/styles/app_styles.dart';

class LimitTitleInput extends SDUIWidget {
  String title = '';
  String subtitle = '';
  double paddingTop = 0.0;
  double paddingBottom = 0.0;
  double paddingLeft = 16.0;
  double paddingRight = 16.0;
  double textsSpacing = 24.0;
  bool hasSelectTime = false;
  String timeSubtitle = '';

  @override
  SDUIWidget fromJson(Map<String, dynamic>? json) {
    title = json?['title'] ?? '';
    subtitle = json?['subtitle'] ?? '';
    paddingTop = json?['paddingTop'] ?? 0.0;
    paddingBottom = json?['paddingBottom'] ?? 0.0;
    paddingLeft = json?['paddingLeft'] ?? 16.0;
    paddingRight = json?['paddingRight'] ?? 16.0;
    textsSpacing = json?['textsSpacing'] ?? 24.0;
    hasSelectTime = json?['hasSelectTime'] ?? false;
    timeSubtitle = json?['timeSubtitle'] ?? '';
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
            style: context.appTextStyles.headlineSmall,
          ),
          SizedBox(height: textsSpacing),
          Text(
            subtitle,
            style: context.appTextStyles.titleSmall.copyWith(
              color: context.appColors.darkGray,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          TextFormField(
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CentavosInputFormatter(),
            ],
            decoration: const InputDecoration(
              prefixText: 'R\$ ',
            ),
          ),
          if (hasSelectTime) const SizedBox(height: 20),
          if (hasSelectTime)
            Text(
              timeSubtitle,
              style: context.appTextStyles.titleSmall.copyWith(
                color: context.appColors.darkGray,
                fontWeight: FontWeight.w500,
              ),
            ),
          if (hasSelectTime) const SizedBox(height: 4),
          if (hasSelectTime)
            SizedBox(
              height: 50,
              width: 300,
              child: Row(
                children: [
                  SizedBox(
                      width: 111,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          HoraInputFormatter(),
                        ],
                      )),
                  const SizedBox(width: 16),
                  SizedBox(
                    width: 111,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        HoraInputFormatter(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
