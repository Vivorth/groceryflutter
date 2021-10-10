import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:groceryflutter/models/cartmodel.dart';
import 'package:groceryflutter/models/category.dart';
import 'package:groceryflutter/models/productmodel.dart';
import 'package:groceryflutter/models/user.dart';
import 'package:http/http.dart' as http;

class DataController extends GetxController {
  var categoriesList = <CategoryModel>[].obs;
  String categoriesUrl =
      "http://10.0.2.2:4000/categories"; //emulator local host
  String featured_url = "http://10.0.2.2:4000/categories/Featured";
  var featuredList = <ProductModel>[].obs;
  var NewList = <ProductModel>[].obs;
  String new_url = "http://10.0.2.2:4000/categories/New";
  String byCategory_Url = "http://10.0.2.2:4000/categories/";
  var byCategoryList = <ProductModel>[].obs;

  var user_url = "http://10.0.2.2:4000/users/find/";
  User user = User(
      address: '',
      cart: [],
      password: '',
      email: '',
      id: '',
      image: '',
      isAdmin: false,
      name: '',
      phoneNo: '');

  Rx<List<Cart>> cart = Rx<List<Cart>>([]);
  List<Cart> get carts => cart.value.obs;
  var listcart = <Cart>[].obs;

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

  Future<User> userDetail() async {
    var userID = await const FlutterSecureStorage().read(key: 'userID');
    var token = await const FlutterSecureStorage().read(key: 'token');

    final response =
        await http.get(Uri.parse(user_url + userID.toString()), headers: {
      'token': 'Bearer ${token}',
    });

    user = userFromJson(response.body);
    return user;
  }

  Future<List<Cart>> getCart1() async {
    var userID =
        (await const FlutterSecureStorage().read(key: 'userID')).toString();

    final response =
        await http.get(Uri.parse("http://10.0.2.2:4000/users/${userID}/cart/"));

    listcart.assignAll(cartFromJson(response.body));
    print(listcart);
    return listcart;
  }

  String checkplatform() {
    if (Platform.isAndroid) {
      return "Android";
    } else if (Platform.isIOS) {
      return "IOS";
    } else if (Platform.isWindows) {
      return "Windows";
    } else {
      // web
      return "Web";
    }
  }
}
