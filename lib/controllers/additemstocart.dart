import 'package:get/get.dart';
import 'package:groceryflutter/models/featureditems.dart';

class AddItemToCardController extends GetxController {
  var totalprice = 0.0.obs;
  var numberofitems = 0.obs;
  var itemsincart = [].obs;

  increment() {
    numberofitems.value++;
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
