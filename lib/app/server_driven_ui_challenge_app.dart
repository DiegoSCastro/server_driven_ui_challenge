import 'package:flutter/material.dart';
import 'package:sdui/sdui.dart';
import 'package:server_driven_ui_challenge/app/core/ui/theme/theme_config.dart';

import '../main.dart';
import 'core/config/env.dart';
import 'core/utils/json_reader.dart';
import 'features/splash/splash.dart';
import 'services/firebase/remote_config_repository.dart';

class ServerDrivenUiChallengeApp extends StatefulWidget {
  const ServerDrivenUiChallengeApp({super.key});

  @override
  State<ServerDrivenUiChallengeApp> createState() => _ServerDrivenUiChallengeAppState();
}

class _ServerDrivenUiChallengeAppState extends State<ServerDrivenUiChallengeApp> {
  final RemoteConfigRepository remoteConfig = getIt<RemoteConfigRepository>();
  String get home =>
      Env.i['USE_REMOTE_CONFIG'] == 'TRUE' ? remoteConfig.getString('home') : homeJson;
  String get pixLimit =>
      Env.i['USE_REMOTE_CONFIG'] == 'TRUE' ? remoteConfig.getString('pix_limit') : pixLimitJson;

  Map<String, WidgetBuilder> _routes() => {
        '/': (context) => const Splash(),
        '/home': (context) => DynamicRoute(
              provider: StaticRouteContentProvider(home),
            ),
        '/transactionLimitJson': (context) => DynamicRoute(
              provider: StaticRouteContentProvider(pixLimit),
            ),
      };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Server Driven Ui',
      theme: ThemeConfig.theme,
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: _routes(),
    );
  }
}
