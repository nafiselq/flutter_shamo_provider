import 'package:flutter/material.dart';
import 'package:flutter_shamo_provider/data/models/cart_model.dart';
import 'package:flutter_shamo_provider/data/models/product_model.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _cart = [];
  List<CartModel> get carts => _cart;

  set carts(List<CartModel> carts) {
    _cart = carts;
    notifyListeners();
  }

  addCart(ProductModel productModel) {
    if (productExist(productModel)) {
      int index = _cart
          .indexWhere((element) => element.productModel?.id == productModel.id);
      _cart[index].quantity = _cart[index].quantity! + 1;
    } else {
      _cart.add(CartModel(
        id: _cart.length,
        productModel: productModel,
        quantity: 1,
      ));
    }

    notifyListeners();
  }

  removeCart(int id) {
    _cart.removeAt(id);
    notifyListeners();
  }

  addQuantity(int id) {
    print("ini cart ${_cart[id].quantity}");
    _cart[id].quantity = _cart[id].quantity! + 1;
    notifyListeners();
  }

  reduceQuantity(int id) {
    _cart[id].quantity = _cart[id].quantity! - 1;
    if (_cart[id].quantity == 0) {
      _cart.removeAt(id);
    }
    notifyListeners();
  }

  totalItems() {
    int total = 0;
    for (var item in _cart) {
      total += item.quantity!;
    }
    return total;
  }

  totalPrice() {
    double total = 0;
    for (var item in _cart) {
      total += (item.quantity! * item.productModel!.price!);
    }
    return total;
  }

  productExist(ProductModel productModel) {
    if (_cart.indexWhere((element) => element.id == productModel.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
