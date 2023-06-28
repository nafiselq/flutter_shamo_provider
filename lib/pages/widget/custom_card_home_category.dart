import 'package:flutter/material.dart';

import '../../utils/theme.dart';

class CustomCardHomeCategory extends StatelessWidget {
  const CustomCardHomeCategory({
    super.key,
    required this.isActive,
    required this.name,
  });

  final bool isActive;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 83,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
          color: isActive ? primaryColor : backgroundColor1,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isActive ? primaryColor : const Color(0xff302F37),
          )),
      child: Center(
        child: Text(
          name,
          style: isActive
              ? whitePrimaryTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: medium,
                )
              : greyTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: medium,
                ),
        ),
      ),
    );
  }
}
