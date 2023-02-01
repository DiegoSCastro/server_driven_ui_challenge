import 'package:flutter/material.dart';
import 'package:sdui/sdui.dart';
import 'package:server_driven_ui_challenge/app/core/ui/theme/theme_config.dart';
import 'package:server_driven_ui_challenge/app/core/utils/json_reader.dart';

import 'features/splash/splash.dart';

class ServerDrivenUiChallengeApp extends StatefulWidget {
  const ServerDrivenUiChallengeApp({super.key});

  @override
  State<ServerDrivenUiChallengeApp> createState() => _ServerDrivenUiChallengeAppState();
}

class _ServerDrivenUiChallengeAppState extends State<ServerDrivenUiChallengeApp> {
  Map<String, WidgetBuilder> _routes() => {
        '/': (context) => const Splash(),
        '/home': (context) => DynamicRoute(
              provider: StaticRouteContentProvider(homeJson),
            ),
        '/transactionLimitJson': (context) => DynamicRoute(
              provider: StaticRouteContentProvider(pixLimitJson),
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
