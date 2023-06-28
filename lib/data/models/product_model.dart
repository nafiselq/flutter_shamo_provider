import 'package:flutter_shamo_provider/data/models/category_model.dart';
import 'package:flutter_shamo_provider/data/models/gallery_model.dart';

class ProductModel {
  int? id;
  String? name;
  double? price;
  String? description;
  String? tags;
  int? categoriesId;
  DateTime? createdAt;
  DateTime? updatedAt;
  CategoryModel? categoryModel;
  List<GalleryModel>? galleryModel;

  ProductModel({
    this.id,
    this.name,
    this.price,
    this.description,
    this.tags,
    this.categoriesId,
    this.createdAt,
    this.updatedAt,
    this.categoryModel,
    this.galleryModel,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = double.parse(json['price'].toString());
    description = json['description'];
    tags = json['tags'];
    categoriesId = json['categories_id'];
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
    categoryModel = CategoryModel.fromJson(json['category']);
    galleryModel = json['galleries']
        .map<GalleryModel>((res) => GalleryModel.fromJson(res))
        .toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'tags': tags,
      'categories_id': categoriesId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'category': categoryModel,
    };
  }
}

class UninitializedProuct extends ProductModel {}
