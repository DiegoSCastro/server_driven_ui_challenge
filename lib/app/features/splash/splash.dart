import 'package:flutter/material.dart';
import 'package:server_driven_ui_challenge/app/core/ui/styles/app_colors.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1))
        .then((_) => Navigator.of(context).pushReplacementNamed('/home'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.primary,
      body: Center(
        child: CircularProgressIndicator(
          color: context.appColors.white,
        ),
      ),
    );
  }
}
