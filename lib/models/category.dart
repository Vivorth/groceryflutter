import 'dart:convert';

List<CategoryModel> categoryModelFromJson(String str) => List<CategoryModel>.from(json.decode(str).map((x) => CategoryModel.fromJson(x))); //decode String to json and pass it to model


class CategoryModel {
  CategoryModel({
    required this.label,
    required this.icon,
    required this.color,
  });
  late final String label;
  late final int icon;
  late final String color;
  
    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        label: json["label"],
        icon: json["icon"],
        color: json["color"],
    );


}