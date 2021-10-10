import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

class User {
  User(
      {required this.id,
      required this.cart,
      required this.name,
      required this.email,
      required this.password,
      required this.address,
      required this.isAdmin,
      required this.image,
      required this.phoneNo});

  String id;
  List<String> cart;
  String name;
  String email;
  String password;
  String address;
  bool isAdmin;
  String image;
  String phoneNo;
  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json["_id"],
      cart: List<String>.from(json["cart"].map((x) => x)),
      name: json["name"],
      email: json["email"],
      password: json["password"],
      address: json["address"],
      isAdmin: json["isAdmin"],
      image: json["image"],
      phoneNo: json["phoneNo"]);
}
