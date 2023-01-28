import 'package:flutter/material.dart';
import 'package:sdui/sdui.dart';
import 'package:server_driven_ui_challenge/app/server_driven_ui_challenge_app.dart';
import 'package:server_driven_ui_challenge/app/widgets/custom_app_bar.dart';

import 'app/widgets/my_widget.dart';

void main() {
  SDUIWidgetRegistry.getInstance().register('MyWidget', () => MyWidget());
  SDUIWidgetRegistry.getInstance().register('CustomAppBar', () => CustomAppBar());
  runApp(const ServerDrivenUiChallengeApp());
}
