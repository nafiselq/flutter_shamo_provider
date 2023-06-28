import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_shamo_provider/providers/preferences_auth_provider.dart';
import 'package:flutter_shamo_provider/providers/product_provider.dart';
import 'package:provider/provider.dart';
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
    getInit();
  }

  getInit() async {
    var duration = const Duration(milliseconds: 1500);
    await Provider.of<ProductProvider>(context, listen: false).getProducts();
    await Provider.of<ProductProvider>(context, listen: false)
        .getCategoryProducts();
    PreferencesAuthProvider authProvider =
        Provider.of<PreferencesAuthProvider>(context, listen: false);
    // ignore: use_build_context_synchronously
    return Timer(duration, () {
      print("ini testing authprovider : ${authProvider.token}");
      if (authProvider.token != null) {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, '/sign-in', (route) => false);
      }
    });
    // Timer(
    //   const Duration(seconds: 2),
    //   () {
    //     NaTivigator.pushNamedAndRemoveUntil(
    //         context, '/sign-in', (route) => false);
    //   },
    // );
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
