import 'package:flutter/material.dart';

import '../../../core/ui/styles/app_styles.dart';

class BalanceVisible extends StatelessWidget {
  final String label;
  final String amount;
  final bool visible;
  const BalanceVisible({
    Key? key,
    required this.label,
    required this.amount,
    this.visible = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: context.appTextStyles.bodyMedium.copyWith(color: context.appColors.white),
          ),
          const SizedBox(height: 8),
          Text(
            'R\$ ${visible ? amount : '●●●●●●●●●'}',
            style: context.appTextStyles.bodyLarge.copyWith(color: context.appColors.white),
          ),
        ],
      ),
    );
  }
}
