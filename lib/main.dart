import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart' hide BackButton;
import 'package:get_it/get_it.dart';
import 'package:sdui/sdui.dart';
import 'package:server_driven_ui_challenge/app/core/utils/json_reader.dart';
import 'package:server_driven_ui_challenge/app/services/firebase/remote_config_impl.dart';

import 'app/core/config/env.dart';
import 'app/features/account/widgets/custom_app_bar/custom_app_bar.dart';
import 'app/features/account/widgets/custom_text_icon_button.dart';
import 'app/features/account/widgets/payment_section/payment_section.dart';
import 'app/features/account/widgets/payment_section/section_icon_buttom.dart';
import 'app/features/pix_limits/widgets/back_button.dart';
import 'app/features/pix_limits/widgets/custom_elevated_button.dart';
import 'app/features/pix_limits/widgets/limit_title_input.dart';
import 'app/features/pix_limits/widgets/transaction_limit_title.dart';
import 'app/server_driven_ui_challenge_app.dart';
import 'app/services/firebase/remote_config_repository.dart';
import 'firebase_options.dart';

final getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Env.i.load();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupLocator();

  await JsonReader().init();
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

void setupLocator() {
  getIt.registerSingleton<RemoteConfigRepository>(RemoteConfigImpl());
  getIt<RemoteConfigRepository>().init();
}
