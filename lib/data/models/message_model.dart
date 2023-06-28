import 'package:flutter_shamo_provider/data/models/product_model.dart';

class MessageModel {
  final String? message;
  final int? userId;
  final String? userName;
  final String? userImage;
  final bool? isFromUser;
  final ProductModel? productModel;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  MessageModel({
    this.message,
    this.userId,
    this.userName,
    this.userImage,
    this.isFromUser,
    this.productModel,
    this.createdAt,
    this.updatedAt,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        message: json['message'],
        userId: json['userId'],
        userName: json['userName'],
        userImage: json['userImage'],
        isFromUser: json['isFromUser'],
        productModel: json['product'] == {}
            ? UninitializedProuct()
            : ProductModel.fromJson(json['product']),
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
      );
}
