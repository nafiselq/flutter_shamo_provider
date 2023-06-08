import 'package:flutter/material.dart';
import 'package:flutter_shamo_provider/utils/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Text(
          "ProfilePage",
          style: whitePrimaryTextStyle,
        ),
      ),
    );
  }
}
