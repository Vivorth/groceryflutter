// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'dart:convert';

List<Cart> cartFromJson(String str) =>
    List<Cart>.from(json.decode(str).map((x) => Cart.fromJson(x)));

class Cart {
  Cart({
    required this.id,
    required this.productId,
    required this.owner,
  });

  String id;
  ProductId productId;
  String owner;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["_id"],
        productId: ProductId.fromJson(json["productID"]),
        owner: json["owner"],
      );
}

class ProductId {
  ProductId({
    required this.id,
    required this.category,
    required this.name,
    required this.price,
    required this.image,
    required this.unit,
  });

  String id;
  List<String> category;
  String name;
  double price;
  String image;
  String unit;

  factory ProductId.fromJson(Map<String, dynamic> json) => ProductId(
        id: json["_id"],
        category: List<String>.from(json["category"].map((x) => x)),
        name: json["name"],
        price: json["price"].toDouble(),
        image: json["image"],
        unit: json["unit"],
      );
}
