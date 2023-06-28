import 'package:flutter/material.dart';
import 'package:flutter_shamo_provider/pages/widget/profile_tile.dart';
import 'package:flutter_shamo_provider/providers/preferences_auth_provider.dart';
import 'package:flutter_shamo_provider/utils/theme.dart';
import 'package:provider/provider.dart';

import '../../data/models/user_model.dart';
import '../../providers/auth_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // void logout() {
    //   PreferencesAuthProvider preferencesAuthProvider =
    //       Provider.of<PreferencesAuthProvider>(context, listen: false);
    //   Navigator.pushNamedAndRemoveUntil(context, '/sign-in', (route) => false);
    //   preferencesAuthProvider.removeUser();
    // }

    Widget header() {
      return Consumer<PreferencesAuthProvider>(
        builder: (context, value, child) {
          return AppBar(
            backgroundColor: backgroundColor1,
            centerTitle: false,
            elevation: 0,
            automaticallyImplyLeading: false,
            flexibleSpace: SafeArea(
              child: Container(
                padding: EdgeInsets.all(defaultMargin),
                child: Row(
                  children: [
                    ClipOval(
                      child: Image.network(
                        "${value.photo}",
                        width: 64,
                        height: 64,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hallo, ${value.name}",
                          style: whitePrimaryTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                          ),
                        ),
                        Text(
                          "@${value.username}",
                          style: secondaryTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: regular,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        value.removeUser();
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/sign-in', (route) => false);
                      },
                      child: Image.asset(
                        "assets/icon_exit.png",
                        width: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          width: double.infinity,
          decoration: BoxDecoration(
            color: backgroundColor3,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                "Account",
                style: whitePrimaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(height: 16),
              ProfileTile(
                label: 'Edit Profile',
                onpPress: () {
                  Navigator.pushNamed(context, '/edit-profile');
                },
              ),
              ProfileTile(
                label: 'Your Orders',
                onpPress: () {},
              ),
              ProfileTile(
                label: 'Help',
                onpPress: () {},
              ),
              const SizedBox(height: 30),
              Text(
                "General",
                style: whitePrimaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(height: 16),
              ProfileTile(
                label: 'Privacy & Policy',
                onpPress: () {},
              ),
              ProfileTile(
                label: 'Term of Service',
                onpPress: () {},
              ),
              ProfileTile(
                label: 'Rate App',
                onpPress: () {},
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
        body: Column(
      children: [
        header(),
        content(),
      ],
    ));
  }
}
