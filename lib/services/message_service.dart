import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_shamo_provider/data/models/product_model.dart';
import 'package:flutter_shamo_provider/data/models/user_model.dart';

class MessageService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addMessage({
    int? userId,
    String? userName,
    String? userImage,
    bool? isFromUser,
    String? message,
    ProductModel? productModel,
  }) async {
    try {
      firestore.collection('messages').add({
        'userId': userId,
        'userName': userName,
        'userImage': userImage,
        'isFromUser': isFromUser,
        'message': message,
        'product':
            productModel is UninitializedProuct ? {} : productModel?.toJson(),
        'createdAt': DateTime.now().toString(),
        'updatedAt': DateTime.now().toString(),
      }).then((value) => print("Pesan barhasil dibuat"));
    } catch (e) {
      throw Exception('Pesan Gagal Dikirim');
    }
  }
}
