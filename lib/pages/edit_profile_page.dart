import 'package:flutter/material.dart';
import 'package:flutter_shamo_provider/providers/preferences_auth_provider.dart';
import 'package:flutter_shamo_provider/utils/theme.dart';
import 'package:provider/provider.dart';

import '../data/models/user_model.dart';
import '../providers/auth_provider.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Edit Profile",
          style: whitePrimaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.close,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.check,
            ),
          ),
          const SizedBox(width: 20),
        ],
      );
    }

    Widget nameInput() {
      return Consumer<PreferencesAuthProvider>(
        builder: (context, value, child) {
          return Container(
            margin: EdgeInsets.only(top: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name",
                  style: secondaryTextStyle.copyWith(
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 4),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: value.name,
                    hintStyle: whitePrimaryTextStyle,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: greyColor,
                      ),
                    ),
                  ),
                  style: whitePrimaryTextStyle,
                ),
              ],
            ),
          );
        },
      );
    }

    Widget usernameInput() {
      return Consumer<PreferencesAuthProvider>(
        builder: (context, value, child) {
          return Container(
            margin: EdgeInsets.only(top: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Username",
                  style: secondaryTextStyle.copyWith(
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 4),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: '@${value.username}',
                    hintStyle: whitePrimaryTextStyle,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: greyColor,
                      ),
                    ),
                  ),
                  style: whitePrimaryTextStyle,
                ),
              ],
            ),
          );
        },
      );
    }

    Widget emailInput() {
      return Consumer<PreferencesAuthProvider>(
        builder: (context, value, child) {
          return Container(
            margin: EdgeInsets.only(top: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Email Address",
                  style: secondaryTextStyle.copyWith(
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 4),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: value.email,
                    hintStyle: whitePrimaryTextStyle,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: greyColor,
                      ),
                    ),
                  ),
                  style: whitePrimaryTextStyle,
                ),
              ],
            ),
          );
        },
      );
    }

    Widget content() {
      return Container(
        padding: EdgeInsets.all(defaultMargin),
        child: Column(
          children: [
            Consumer<PreferencesAuthProvider>(
              builder: (context, value, child) {
                return ClipOval(
                  child: Image.network(
                    "${value.photo}",
                    width: 64,
                  ),
                );
              },
            ),
            nameInput(),
            usernameInput(),
            emailInput(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      body: Column(children: [
        header(),
        content(),
      ]),
    );
  }
}
