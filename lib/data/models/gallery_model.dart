class GalleryModel {
  late final int id;
  late final int productId;
  late final String url;

  GalleryModel({
    required this.id,
    required this.productId,
    required this.url,
  });

  GalleryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['products_id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'products_id': productId,
      'name': url,
    };
  }
}
