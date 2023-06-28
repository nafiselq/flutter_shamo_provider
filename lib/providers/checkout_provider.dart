import 'package:flutter/material.dart';
import 'package:flutter_shamo_provider/services/checkout_service.dart';

import '../data/models/cart_model.dart';

class CheckoutProvider with ChangeNotifier {
  CheckoutService checkoutService = CheckoutService();

  Future<bool> checkout(
      String token, List<CartModel> carts, double totalPrice) async {
    try {
      final responseCheckout =
          await checkoutService.checkout(token, carts, totalPrice);

      if (responseCheckout) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("ini error checkout provider : $e");
      return false;
    }
  }
}
