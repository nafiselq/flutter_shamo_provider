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

  @override
  Widget build(BuildContext context) {
    print("ini current index : $currentIndex");
    Widget cartButton() {
      return FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: secondaryColor,
        onPressed: () {},
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
            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                    print("ini chat");
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
                    print("ini wishlist");
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
                    print("ini profile");
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
      backgroundColor: backgroundColor1,
      body: body(),
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customButtonNav(),
    );
  }
}
