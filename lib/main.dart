import 'package:flutter/material.dart' hide BackButton;
import 'package:sdui/sdui.dart';
import 'package:server_driven_ui_challenge/app/server_driven_ui_challenge_app.dart';
import 'package:server_driven_ui_challenge/app/widgets/custom_app_bar/custom_app_bar.dart';

import 'app/widgets/back_button.dart';
import 'app/widgets/custom_elevated_button.dart';
import 'app/widgets/custom_text_icon_button.dart';
import 'app/widgets/limit_title_input.dart';
import 'app/widgets/my_widget.dart';
import 'app/widgets/payment_section/payment_section.dart';
import 'app/widgets/payment_section/section_icon_buttom.dart';
import 'app/widgets/transaction_limit_title.dart';

void main() {
  SDUIWidgetRegistry.getInstance().register('MyWidget', () => MyWidget());
  SDUIWidgetRegistry.getInstance().register('LimitTitleInput', () => LimitTitleInput());
  SDUIWidgetRegistry.getInstance().register('CustomElevatedButton', () => CustomElevatedButton());
  SDUIWidgetRegistry.getInstance().register('BackButton', () => BackButton());
  SDUIWidgetRegistry.getInstance().register('TransactionLimitTitle', () => TransactionLimitTitle());
  SDUIWidgetRegistry.getInstance().register('CustomTextIconButton', () => CustomTextIconButton());
  SDUIWidgetRegistry.getInstance().register('SectionIconButton', () => SectionIconButton());
  SDUIWidgetRegistry.getInstance().register('PaymentSection', () => PaymentSection());
  SDUIWidgetRegistry.getInstance().register('CustomAppBar', () => CustomAppBar());
  runApp(const ServerDrivenUiChallengeApp());
}
