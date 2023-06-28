import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shamo_provider/data/preferences/auth_preferences.dart';
import 'package:flutter_shamo_provider/pages/cart_page.dart';
import 'package:flutter_shamo_provider/pages/checkout_page.dart';
import 'package:flutter_shamo_provider/pages/checkout_success_page.dart';
import 'package:flutter_shamo_provider/pages/detail_chat_page.dart';
import 'package:flutter_shamo_provider/pages/edit_profile_page.dart';
import 'package:flutter_shamo_provider/pages/home/main_page.dart';
import 'package:flutter_shamo_provider/pages/product_page.dart';
import 'package:flutter_shamo_provider/pages/sign_in_page.dart';
import 'package:flutter_shamo_provider/pages/sign_up_page.dart';
import 'package:flutter_shamo_provider/pages/splash_page.dart';
import 'package:flutter_shamo_provider/providers/auth_provider.dart';
import 'package:flutter_shamo_provider/providers/cart_provider.dart';
import 'package:flutter_shamo_provider/providers/checkout_provider.dart';
import 'package:flutter_shamo_provider/providers/preferences_auth_provider.dart';
import 'package:flutter_shamo_provider/providers/product_provider.dart';
import 'package:flutter_shamo_provider/providers/wishlist_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PreferencesAuthProvider(
            authPreferences: AuthPreferences(
              sharedPreferences: SharedPreferences.getInstance(),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CheckoutProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => const SignUpPage(),
          '/home': (context) => const MainPage(),
          '/edit-profile': (context) => const EditProfilePage(),
          '/cart': (context) => const CartPage(),
          '/checkout': (context) => const CheckoutPage(),
          '/checkout-success': (context) => const CheckoutSuccessPage(),
        },
      ),
    );
  }
}
