import 'dart:convert';

import 'package:flutter_shamo_provider/data/models/category_model.dart';
import 'package:flutter_shamo_provider/data/models/product_model.dart';
import 'package:flutter_shamo_provider/data/models/user_model.dart';
import 'package:flutter_shamo_provider/utils/base_url.dart';
import 'package:http/http.dart' as http;

class ProductServices {
  BaseUrl api = BaseUrl();

  Future<List<ProductModel>> getProducts() async {
    final response = await http.get(Uri.parse('${api.baseUrl}/api/products'));

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)["data"]["data"];
      print("ini data : $data");
      List<ProductModel> products = [];

      for (var item in data) {
        products.add(ProductModel.fromJson(item));
      }

      return products;
    } else {
      throw Exception("Gagal mengamnbil products");
    }
  }

  Future<List<CategoryModel>> getProductGategories() async {
    final response = await http.get(Uri.parse('${api.baseUrl}/api/categories'));

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)["data"]["data"];
      print("ini data response : $data");

      List<CategoryModel> productCategories = [];

      for (var item in data) {
        productCategories.add(CategoryModel.fromJson(item));
      }

      return productCategories;
    } else {
      throw Exception("Gagal mengambil categoy");
    }
  }
}
