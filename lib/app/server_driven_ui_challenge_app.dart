import 'package:flutter/material.dart';
import 'package:sdui/sdui.dart';
import 'package:server_driven_ui_challenge/app/core/ui/theme/theme_config.dart';

import '../main.dart';
import 'features/splash/splash.dart';
import 'services/firebase/remote_config_repository.dart';

class ServerDrivenUiChallengeApp extends StatefulWidget {
  const ServerDrivenUiChallengeApp({super.key});

  @override
  State<ServerDrivenUiChallengeApp> createState() => _ServerDrivenUiChallengeAppState();
}

class _ServerDrivenUiChallengeAppState extends State<ServerDrivenUiChallengeApp> {
  final RemoteConfigRepository remoteConfig = getIt<RemoteConfigRepository>();

  Map<String, WidgetBuilder> _routes() => {
        '/': (context) => const Splash(),
        '/home': (context) => DynamicRoute(
              provider: StaticRouteContentProvider(remoteConfig.getString('home')),
            ),
        '/transactionLimitJson': (context) => DynamicRoute(
              provider: StaticRouteContentProvider(remoteConfig.getString('pix_limit')),
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
