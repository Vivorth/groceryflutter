
import 'package:get/get.dart';
import 'package:groceryflutter/models/category.dart';
import 'package:groceryflutter/models/productmodel.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class DataController extends GetxController {
  var categoriesList = <CategoryModel>[].obs;
  String categoriesUrl = "https://mygrocery-api.herokuapp.com/categories";
  String featured_url =
      "https://mygrocery-api.herokuapp.com/categories/Featured";
  var featuredList = <ProductModel>[].obs;
  var NewList = <ProductModel>[].obs;
  String new_url = "https://mygrocery-api.herokuapp.com/categories/New";
  String byCategory_Url = "https://mygrocery-api.herokuapp.com/categories/";
  var byCategoryList = <ProductModel>[].obs;

  Future<List<CategoryModel>> categoires() async {
    final response = await http.get(Uri.parse(categoriesUrl));

    categoriesList.assignAll(
        categoryModelFromJson(response.body)); // response.body is string
    //categoryModelFromJson will take this string to decode it to CategoryModel format
    //and assign all data to categoriesList

    return categoriesList;
  }

  Future<List<ProductModel>> featured() async {
    final response = await http.get(Uri.parse(featured_url));

    featuredList.assignAll(productModelFromJson(response.body));

    return featuredList;
  }

  Future<List<ProductModel>> New() async {
    final response = await http.get(Uri.parse(new_url));

    NewList.assignAll(productModelFromJson(response.body));

    return NewList;
  }

  Future<List<ProductModel>> byCategory(String type) async {
    final response = await http.get(Uri.parse(byCategory_Url + type));
    byCategoryList.assignAll(productModelFromJson(response.body));
    return byCategoryList;
  }
}
