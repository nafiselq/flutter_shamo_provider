import 'package:flutter/material.dart';
import 'package:flutter_shamo_provider/pages/home/chat_page.dart';
import 'package:flutter_shamo_provider/pages/home/home_page.dart';
import 'package:flutter_shamo_provider/pages/home/profile_page.dart';
import 'package:flutter_shamo_provider/pages/home/wishlist_page.dart';
import 'package:flutter_shamo_provider/utils/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  Widget body() {
    switch (currentIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const ChatPage();
      case 2:
        return const WishListPage();
      case 3:
        return const ProfilePage();
      default:
        return const HomePage();
    }
  }

  changeBackground() {
    if (currentIndex == 0) {
      return backgroundColor1;
    }
    return backgroundColor3;
  }

  @override
  Widget build(BuildContext context) {
    Widget cartButton() {
      return FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: secondaryColor,
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
        child: Image.asset(
          'assets/icon_cart.png',
          width: 20,
          fit: BoxFit.cover,
        ),
      );
    }

    Widget customButtonNav() {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        child: BottomAppBar(
          color: backgroundColor4,
          shape: const CircularNotchedRectangle(),
          notchMargin: 10.0,
          clipBehavior: Clip.antiAlias,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            height: 75,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = 0;
                    });
                  },
                  child: Image.asset(
                    "assets/icon_home.png",
                    width: 25,
                    fit: BoxFit.cover,
                    color: currentIndex == 0 ? const Color(0xff6C5ECF) : null,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = 1;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 100),
                    child: Image.asset(
                      "assets/icon_chat.png",
                      width: 25,
                      fit: BoxFit.cover,
                      color: currentIndex == 1 ? const Color(0xff6C5ECF) : null,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = 2;
                    });
                  },
                  child: Image.asset(
                    "assets/icon_wishlist.png",
                    width: 25,
                    fit: BoxFit.cover,
                    color: currentIndex == 2 ? const Color(0xff6C5ECF) : null,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = 3;
                    });
                  },
                  child: Image.asset(
                    "assets/icon_profile.png",
                    width: 25,
                    fit: BoxFit.cover,
                    color: currentIndex == 3 ? const Color(0xff6C5ECF) : null,
                  ),
                ),
                // const Spacer(),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: changeBackground(),
      body: body(),
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customButtonNav(),
    );
  }
}
