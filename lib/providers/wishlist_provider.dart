// ignore_for_file: unnecessary_getters_setters

import 'package:flutter/material.dart';
import 'package:flutter_shamo_provider/data/models/product_model.dart';

class WishlistProvider with ChangeNotifier {
  List<ProductModel> _wishList = [];
  List<ProductModel> get wishlist => _wishList;

  set wishlist(List<ProductModel> wishlist) {
    _wishList = wishlist;
    notifyListeners();
  }

  setProducts(ProductModel productModel) {
    if (!isWishlist(productModel)) {
      _wishList.add(productModel);
    } else {
      _wishList.removeWhere((element) => element.id == productModel.id);
    }

    notifyListeners();
  }

  isWishlist(ProductModel product) {
    if (_wishList.indexWhere((element) => element.id == product.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
