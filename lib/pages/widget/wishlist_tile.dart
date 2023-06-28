import 'package:flutter/material.dart';
import 'package:flutter_shamo_provider/data/models/product_model.dart';
import 'package:flutter_shamo_provider/providers/wishlist_provider.dart';
import 'package:flutter_shamo_provider/utils/theme.dart';
import 'package:provider/provider.dart';

class WishlistTile extends StatelessWidget {
  const WishlistTile({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail-chat');
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        padding:
            const EdgeInsets.only(top: 10, left: 12, bottom: 14, right: 20),
        decoration: BoxDecoration(
          color: backgroundColor4,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    "${productModel.galleryModel?[0].url}",
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 132,
                        child: Text(
                          "${productModel.name}",
                          style: whitePrimaryTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: semiBold,
                          ),
                        ),
                      ),
                      Text(
                        "\$${productModel.price}",
                        style: priceTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: light,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    wishlistProvider.setProducts(productModel);
                  },
                  child: Image.asset(
                    wishlistProvider.isWishlist(productModel)
                        ? "assets/icon_wishlist_detail_on.png"
                        : "assets/icon_wishlist_detail.png",
                    width: 34,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
