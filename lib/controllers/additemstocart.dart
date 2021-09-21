import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:groceryflutter/models/category.dart';
import 'package:groceryflutter/models/featureditems.dart';
import 'package:groceryflutter/widgets/categories.dart';

class AddItemToCardController extends GetxController {
  var totalprice = 0.0.obs;
  var numberofitems = 0.obs;
  var itemsincart = [].obs;
  var statusbarHeight = 0.0.obs.toDouble();
  
  // List<List<CategoryModel>> category = [
  //   [CategoryModel(Icons.fastfood_outlined, Colors.grey, "Food")],
  //   [Icons.power_off, Colors.blue, "Fruit"],
  //   [Icons.local_grocery_store, Colors.red, "Food"],
  //   [Icons.electric_moped_outlined, Colors.green, "Fruit"],
  //   [Icons.card_giftcard, Colors.red, "Food"],
  //   [Icons.ac_unit, Colors.amber, "Fruit"],
  //   [Icons.ac_unit, Colors.red, "Food"],
  //   [Icons.ac_unit, Colors.amber, "Fruit"],
  // ];
  List<FeaturedItems> featureditems = [
    FeaturedItems("tomato", "Tomato", 12.3, "1kg", "001"),
    FeaturedItems("lemongrass", "Lemon Grass", 10.09, "1kg", "002"),
    FeaturedItems("banana", "Banana", 20, "1kg", "003"),
    FeaturedItems("milktea", "Milk Tea", 30, "1pc", "004"),
    FeaturedItems("tomato", "Tomato", 40, "1kg", "005"),
    FeaturedItems("lemongrass", "Lemon Grass", 50.2, "1kg", "006"),
    FeaturedItems("banana", "Banana", 60.9, "1kg", "007"),
    FeaturedItems("milktea", "Milk Tea", 10.2, "1pc", "008"),
    FeaturedItems("tomato", "Tomato", 1.1, "1kg", "009"),
    FeaturedItems("lemongrass", "Lemon Grass", 1.12, "1kg", "010"),
    FeaturedItems("banana", "Banana", 3.4, "1kg", "011"),
    FeaturedItems("milktea", "Milk Tea", 5.6, "1pc", "012"),
  ];

  increment() {
    numberofitems.value++;
  }

  getStatusBarHeight(context) {
    //for child widget it will turn 0 in status bar so we need to get it from here
    // init it in main screen
    statusbarHeight = MediaQuery.of(context).padding.top;
  }

  additem(String image, String label, double price, String unit, String id) {
    var count = 0;
    totalprice.value += price;

    if (itemsincart.isNotEmpty) {
      for (var i = 0; i < itemsincart.length; i++) {
        if (id == itemsincart[i][0].id) {
          itemsincart[i][1] += 1;
          count = 1;
        } else if (count == 0 && i == itemsincart.length - 1) {
          itemsincart
              .add([FeaturedItems(image, label, price, unit, id), 1.obs]);
          break;
        }
      }
    } else {
      itemsincart.add([FeaturedItems(image, label, price, unit, id), 1.obs]);
    }
  }

  decreasecartitems(index) {
    totalprice.value -= itemsincart[index][0].price;
    if (itemsincart[index][1].value > 1) {
      itemsincart[index][1] = itemsincart[index][1] - 1;
      numberofitems -= 1;
    } else if (itemsincart[index][1].value == 1) {
      itemsincart.removeAt(index);
      numberofitems -= 1;
    }
  }

  increasecartitem(index) {
    totalprice.value += itemsincart[index][0].price;

    itemsincart[index][1].value += 1;
    numberofitems += 1;
  }
}
