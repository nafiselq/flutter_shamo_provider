import 'package:flutter/material.dart';
import 'package:flutter_shamo_provider/utils/theme.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.label,
    required this.onpPress,
  });

  final String label;
  final Function() onpPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: secondaryTextStyle.copyWith(
            fontSize: 13,
            fontWeight: regular,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: onpPress,
          icon: Icon(
            Icons.arrow_forward_ios,
            color: greyColor,
          ),
        ),
      ],
    );
  }
}
