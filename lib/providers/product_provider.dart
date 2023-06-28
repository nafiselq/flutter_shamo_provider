import 'package:flutter/material.dart';
import 'package:flutter_shamo_provider/data/models/category_model.dart';
import 'package:flutter_shamo_provider/data/models/product_model.dart';
import 'package:flutter_shamo_provider/services/product_service.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = [];
  List<ProductModel> get products => _products;
  set products(List<ProductModel> products) {
    _products = products;
    notifyListeners();
  }

  List<CategoryModel> _categoryProducts = [];
  List<CategoryModel> get categoryProducts => _categoryProducts;
  set categoryProducts(List<CategoryModel> categoryProducts) {
    _categoryProducts = categoryProducts;
    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      List<ProductModel> products = await ProductServices().getProducts();
      print(" INI LIST PRODUCTS : $products");
      _products = products;
    } catch (e) {
      print("eror : $e");
      // throw Exception(e.toString());
    }
  }

  Future<void> getCategoryProducts() async {
    try {
      List<CategoryModel> categoryProducts =
          await ProductServices().getProductGategories();
      _categoryProducts = categoryProducts;
    } catch (e) {
      print("error category products : $e");
    }
  }
}
