// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

class ProductModel {
  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.unit,
  });

  late String id;
  late String name;
  late double price;
  late String image;
  late String unit;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["_id"],
        name: json["name"],
        price:
            json["price"] % 1 != 0 ? json["price"] : json["price"].toDouble(),
        image: json["image"],
        unit: json["unit"],
      );
}
