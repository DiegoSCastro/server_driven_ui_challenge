import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sdui/sdui.dart';

class BackButton extends SDUIWidget {
  @override
  SDUIWidget fromJson(Map<String, dynamic>? json) {
    return this;
  }

  @override
  Widget toWidget(BuildContext context) {
    return InkWell(
      onTap: Navigator.of(context).pop,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: SvgPicture.asset(
          'assets/images/arrow_back_ios.svg',
        ),
      ),
    );
  }
}
