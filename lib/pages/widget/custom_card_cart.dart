import 'package:flutter/material.dart';
import 'package:flutter_shamo_provider/data/models/cart_model.dart';
import 'package:flutter_shamo_provider/providers/cart_provider.dart';
import 'package:flutter_shamo_provider/utils/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomCardCart extends StatelessWidget {
  const CustomCardCart({super.key, required this.cartModel});

  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor4,
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  "${cartModel.productModel?.galleryModel?[0].url}",
                  width: 60,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${cartModel.productModel?.name}",
                      style: whitePrimaryTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "\$${cartModel.productModel?.price}",
                      style: priceTextStyle.copyWith(
                        fontWeight: regular,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      cartProvider.addQuantity(cartModel.id!);
                    },
                    child: Image.asset(
                      "assets/icon_plus.png",
                      width: 16,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "${cartModel.quantity}",
                    style: whitePrimaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(height: 2),
                  GestureDetector(
                    onTap: () {
                      cartProvider.reduceQuantity(cartModel.id!);
                    },
                    child: Image.asset(
                      "assets/icon_minus.png",
                      width: 16,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () {
              cartProvider.removeCart(cartModel.id!);
            },
            child: Row(
              children: [
                Image.asset(
                  "assets/icon_trash.png",
                  width: 10,
                ),
                const SizedBox(width: 4),
                Text(
                  "Remove",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: light,
                    color: alertColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
