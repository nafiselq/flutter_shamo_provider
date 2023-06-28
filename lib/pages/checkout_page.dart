import 'package:flutter/material.dart';
import 'package:flutter_shamo_provider/pages/widget/custom_card_item_checkout.dart';
import 'package:flutter_shamo_provider/pages/widget/custom_loading_button.dart';
import 'package:flutter_shamo_provider/providers/auth_provider.dart';
import 'package:flutter_shamo_provider/providers/cart_provider.dart';
import 'package:flutter_shamo_provider/providers/checkout_provider.dart';
import 'package:flutter_shamo_provider/utils/theme.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    CheckoutProvider checkoutProvider = Provider.of<CheckoutProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleButtonCheckout() async {
      setState(() {
        isLoading = !isLoading;
      });

      print({
        'token': authProvider.user?.token,
        'carts': cartProvider.carts,
        'total_price': cartProvider.totalItems(),
      });

      if (await checkoutProvider.checkout(
        authProvider.user!.token.toString(),
        cartProvider.carts,
        cartProvider.totalPrice(),
      )) {
        setState(() {
          isLoading = !isLoading;
        });
        cartProvider.carts = [];
        // ignore: use_build_context_synchronously
        Navigator.pushNamedAndRemoveUntil(
            context, '/checkout-success', (route) => false);
      }
    }

    AppBar header() {
      return AppBar(
        elevation: 0,
        backgroundColor: backgroundColor1,
        title: Text(
          "Checkout Details",
          style: whitePrimaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget cardAddressDetails() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: backgroundColor4,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Address Details",
              style: whitePrimaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Column(
                  children: [
                    Image.asset(
                      "assets/icon_store_location.png",
                      width: 40,
                    ),
                    Image.asset(
                      "assets/icon_line.png",
                      width: 1,
                    ),
                    Image.asset(
                      "assets/icon_location_address.png",
                      width: 40,
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                Column(
                  children: [
                    Text(
                      "Store Location",
                      style: secondaryTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: light,
                      ),
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    Text(
                      "Adidas Core",
                      style: whitePrimaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                      ),
                    ),
                    SizedBox(height: defaultMargin),
                    Text(
                      "Your Address",
                      style: secondaryTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: light,
                      ),
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    Text(
                      "Marsemoon",
                      style: whitePrimaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget cardPaymentSumarry() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: backgroundColor4,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Payment Summary",
              style: whitePrimaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  "Product Quantity",
                  style: secondaryTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                  ),
                ),
                const Spacer(),
                Text(
                  "${cartProvider.totalItems()} Items",
                  style: whitePrimaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 13),
            Row(
              children: [
                Text(
                  "Product Price",
                  style: secondaryTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                  ),
                ),
                const Spacer(),
                Text(
                  "\$${cartProvider.totalPrice()}",
                  style: whitePrimaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 13),
            Row(
              children: [
                Text(
                  "Shipping",
                  style: secondaryTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                  ),
                ),
                const Spacer(),
                Text(
                  "Free",
                  style: whitePrimaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 11),
            const Divider(
              thickness: 1,
              color: Color(0xff2E3141),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "Total",
                  style: priceTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                ),
                const Spacer(),
                Text(
                  "\$${cartProvider.totalPrice()}",
                  style: priceTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget listItem() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "List Items",
              style: whitePrimaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const SizedBox(height: 12),
            Column(
              children: cartProvider.carts
                  .map(
                    (item) => CustomCardItemCheckout(cartModel: item),
                  )
                  .toList(),
            ),
            cardAddressDetails(),
            cardPaymentSumarry(),
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          listItem(),
        ],
      );
    }

    Widget contentBottom() {
      return SizedBox(
        height: 200,
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Divider(
              thickness: 1,
              color: Color(0xff2B2938),
            ),
            isLoading
                ? Container(
                    margin: EdgeInsets.only(
                      bottom: defaultMargin,
                      left: defaultMargin,
                      right: defaultMargin,
                    ),
                    child: const CustomLoadingButton(),
                  )
                : Container(
                    height: 50,
                    width: double.infinity,
                    margin: EdgeInsets.only(
                        left: defaultMargin,
                        right: defaultMargin,
                        top: defaultMargin),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        handleButtonCheckout();
                      },
                      child: Text(
                        "Checkout Now",
                        style: whitePrimaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                    ),
                  )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      body: content(),
      bottomNavigationBar: contentBottom(),
    );
  }
}
