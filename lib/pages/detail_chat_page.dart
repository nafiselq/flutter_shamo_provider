import 'package:flutter/material.dart';
import 'package:flutter_shamo_provider/data/models/product_model.dart';
import 'package:flutter_shamo_provider/pages/widget/custom_chat_bubble.dart';
import 'package:flutter_shamo_provider/providers/preferences_auth_provider.dart';
import 'package:flutter_shamo_provider/services/message_service.dart';
import 'package:flutter_shamo_provider/utils/theme.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  TextEditingController message = TextEditingController();

  checkPreviewProduct() {
    if (widget.productModel is UninitializedProuct) {
      return true;
    }
    return false;
  }

  submitMessage(value) async {
    await MessageService().addMessage(
      userId: value.userId,
      userName: value.username,
      userImage: value.photo,
      isFromUser: true,
      message: message.text,
      productModel: widget.productModel,
    );
  }

  @override
  Widget build(BuildContext context) {
    PreferredSize header() {
      return PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: backgroundColor1,
          centerTitle: false,
          elevation: 0,
          title: Row(
            children: [
              Stack(
                children: [
                  Image.asset(
                    "assets/logo_shop.png",
                    width: 50,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Image.asset(
                      "assets/icon_online.png",
                      width: 15,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Shoe Store",
                    style: whitePrimaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                  Text(
                    "Online",
                    style: secondaryTextStyle.copyWith(
                      fontSize: 13,
                      fontWeight: light,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }

    Widget productReview() {
      return Container(
        width: 225,
        height: 74,
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: backgroundColor5,
          border: Border.all(
            color: priceColor,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                widget.productModel.galleryModel![0].url.toString(),
                width: 54,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.productModel.name!,
                    style: whitePrimaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "\$${widget.productModel.price}",
                    style: priceTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Image.asset(
                "assets/icon_close.png",
                width: 22,
              ),
            ),
          ],
        ),
      );
    }

    Widget formChat() {
      return Consumer<PreferencesAuthProvider>(
        builder: (context, value, _) {
          return Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                checkPreviewProduct() ? const SizedBox() : productReview(),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 45,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: backgroundColor4,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: TextFormField(
                            controller: message,
                            // maxLines: 5,
                            style: TextStyle(
                              color: greyColor,
                            ),
                            decoration: InputDecoration.collapsed(
                              hintText: 'Type Message...',
                              hintStyle: greyTextStyle.copyWith(
                                  fontSize: 14, fontWeight: regular),
                              fillColor: greyColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () => submitMessage(value),
                      child: Image.asset(
                        "assets/icon_btn_submit.png",
                        width: 45,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        children: const [
          CustomChatBubble(
            isSender: true,
            text: 'Hi, This item is still available?',
            hasPrdouct: true,
          ),
          CustomChatBubble(
            isSender: false,
            text: 'Good night, This item is only available in size 42 and 43',
          ),
        ],
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: header(),
      backgroundColor: backgroundColor3,
      body: content(),
      bottomNavigationBar: formChat(),
    );
  }
}
