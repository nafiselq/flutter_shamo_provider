import 'package:flutter/material.dart';
import 'package:flutter_shamo_provider/utils/theme.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Text(
          "WishListPage",
          style: whitePrimaryTextStyle,
        ),
      ),
    );
  }
}
