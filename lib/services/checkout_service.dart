import 'dart:convert';

import 'package:flutter_shamo_provider/utils/base_url.dart';
import 'package:http/http.dart' as http;

import '../data/models/cart_model.dart';

class CheckoutService {
  BaseUrl api = BaseUrl();

  Future<bool> checkout(
      String token, List<CartModel> carts, double totalPrice) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    final body = jsonEncode({
      'address': 'Marsemoon',
      'items': carts
          .map(
            (item) => {
              'id': item.productModel?.id,
              'quantity': item.quantity,
            },
          )
          .toList(),
      'status': 'PENDING',
      'total_price': totalPrice,
      'shipping_price': 0,
    });

    print("ini body checkout : $body");

    final response = await http.post(
      Uri.parse(
        '${api.baseUrl}/api/checkout',
      ),
      body: body,
      headers: headers,
    );

    print("ini response checkout : ${response.body}");

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal hit Checkout');
    }
  }
}
