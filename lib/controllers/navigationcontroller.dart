import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:groceryflutter/main.dart';
import 'package:groceryflutter/screens/cart.dart';
import 'package:groceryflutter/screens/cart.dart';
import 'package:groceryflutter/screens/profile.dart';

class navigation extends GetxController {
  var screen = "";
  navigateTo() {
    print(screen);
    if (screen == "Cart") {
      Get.to(() => Cart());
    } else if (screen == "Profile") {
      Get.to(() => ProfileInfo());
    } else if (screen == "MyHomePage") {
      Get.to(() => MyHomePage());
    }
  }
}
