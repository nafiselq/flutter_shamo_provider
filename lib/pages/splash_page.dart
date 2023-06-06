import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_shamo_provider/pages/sign_in_page.dart';
import '../utils/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () {
        Navigator.pushNamedAndRemoveUntil(
            context, '/sign-in', (route) => false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Container(
          height: 150,
          width: 130,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/logo_splash.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
