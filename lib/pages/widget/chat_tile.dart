import 'package:flutter/material.dart';
import 'package:flutter_shamo_provider/data/models/product_model.dart';
import 'package:flutter_shamo_provider/pages/detail_chat_page.dart';
import 'package:flutter_shamo_provider/utils/theme.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              productModel: UninitializedProuct(),
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/logo_shop.png",
                  width: 54,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Shoe Store",
                        style: whitePrimaryTextStyle.copyWith(
                          fontSize: 15,
                          fontWeight: regular,
                        ),
                      ),
                      Text(
                        "Good night, This item is onasdsaadasdadasdasasddadasdsadadas",
                        style: secondaryTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: light,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Text(
                  "Now",
                  style: secondaryTextStyle.copyWith(
                    fontSize: 10,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Divider(
              color: Color(0xff2B2939),
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
