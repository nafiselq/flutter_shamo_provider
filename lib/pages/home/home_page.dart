import 'package:flutter/material.dart';
import 'package:flutter_shamo_provider/data/models/user_model.dart';
import 'package:flutter_shamo_provider/pages/widget/custom_card_home_category.dart';
import 'package:flutter_shamo_provider/pages/widget/custom_card_new_arrivals.dart';
import 'package:flutter_shamo_provider/pages/widget/custom_card_popular_product.dart';
import 'package:flutter_shamo_provider/providers/auth_provider.dart';
import 'package:flutter_shamo_provider/providers/preferences_auth_provider.dart';
import 'package:flutter_shamo_provider/providers/product_provider.dart';
import 'package:flutter_shamo_provider/utils/theme.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    Widget header() {
      return Consumer<PreferencesAuthProvider>(
        builder: (context, value, _) {
          return Container(
            margin: EdgeInsets.all(defaultMargin),
            child: Row(
              children: [
                Expanded(
                  child: Column(
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
                        style: greyTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: regular,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                ClipOval(
                  child: Image.network(
                    "${value.photo}",
                    width: 54,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    Widget kategori() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(width: defaultMargin),
            Row(
              children: productProvider.categoryProducts
                  .map(
                    (item) => CustomCardHomeCategory(
                      isActive: false,
                      name: item.name.toString(),
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      );
    }

    Widget textPouplarProduct() {
      return Container(
        margin: EdgeInsets.only(left: defaultMargin, top: defaultMargin),
        child: Text(
          "Popular Products",
          style: whitePrimaryTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget popularProduct() {
      return Container(
        margin: const EdgeInsets.only(top: 14),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: defaultMargin),
              Row(
                children: productProvider.products
                    .map(
                      (item) => CustomCardPopularProducts(productModel: item),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      );
    }

    Widget textNewArrivals() {
      return Container(
        margin: EdgeInsets.only(left: defaultMargin, top: defaultMargin),
        child: Text(
          "New Arrivals",
          style: whitePrimaryTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget newArrivals() {
      return Container(
        margin: EdgeInsets.only(top: 14, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: productProvider.products
              .map(
                (item) => CustomCardNewArrivals(
                  productModel: item,
                ),
              )
              .toList(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      body: ListView(
        children: [
          header(),
          kategori(),
          textPouplarProduct(),
          popularProduct(),
          textNewArrivals(),
          newArrivals(),
        ],
      ),
    );
  }
}
