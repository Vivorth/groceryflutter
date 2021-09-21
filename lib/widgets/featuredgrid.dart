import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:groceryflutter/controllers/dataController.dart';
import 'package:groceryflutter/models/productmodel.dart';
import '../controllers/additemstocart.dart';
import '../models/featureditems.dart';

class FeaturedGrid extends StatelessWidget {
  final AddItemToCardController addItemToCardController =
      Get.put(AddItemToCardController());

  final DataController dataController = Get.put(DataController());
  late final String type;
  FeaturedGrid(this.type);

  // final List data = [
  //   {
  //     "image": "tomato",
  //     "label": "Tomato",
  //     "price": 12,
  //     "unit": "1kg",
  //   },
  //   {"image": "lemongrass", "label": "Lemon Grass", "price": 12, "unit": "1kg"},
  //   {"image": "banana", "label": "Banana", "price": 12, "unit": "1kg"},
  //   {"image": "milktea", "label": "Milk Tea", "price": 12, "unit": "1kg"},
  //   {
  //     "image": "tomato",
  //     "label": "Tomato",
  //     "price": 12,
  //     "unit": "1kg",
  //   },
  //   {"image": "lemongrass", "label": "Lemon Grass", "price": 12, "unit": "1kg"},
  //   {"image": "banana", "label": "Banana", "price": 12, "unit": "1kg"},
  //   {"image": "milktea", "label": "Milk Tea", "price": 12, "unit": "1kg"},
  //   {
  //     "image": "tomato",
  //     "label": "Tomato",
  //     "price": 12,
  //     "unit": "1kg",
  //   },
  //   {"image": "lemongrass", "label": "Lemon Grass", "price": 12, "unit": "1kg"},
  //   {"image": "banana", "label": "Banana", "price": 12, "unit": "1kg"},
  //   {"image": "milktea", "label": "Milk Tea", "price": 12, "unit": "1kg"},
  // ];
  @override
  Widget build(BuildContext context) {
    double textscalefactor = MediaQuery.of(context)
        .textScaleFactor; //in case they change fontsize in settings of their system
    final List<FeaturedItems> featureditems =
        addItemToCardController.featureditems;

    double width = MediaQuery.of(context).size.width;
    return FutureBuilder(
        future: dataController.byCategory(type),
        builder: (context, AsyncSnapshot<List<ProductModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LinearProgressIndicator();
          }

          var list = snapshot.data!;
          return Padding(
              padding: EdgeInsets.all(10.w),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: list.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.8,
                    crossAxisCount: 2,
                    crossAxisSpacing: 5),
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Expanded(
                            child: Container(
                                child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                                image: NetworkImage(list[index].image),
                                height: 80.w),
                            SizedBox(
                              height: 5.sp,
                            ),
                            Text(
                              '\$${list[index].price.toStringAsFixed(2)}',
                              style: TextStyle(
                                  fontSize:
                                      14.w, // /350 to make responsive text
                                  color: Colors.green[500],
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5.sp,
                            ),
                            Text(
                              list[index].name,
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 24.w,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 5.sp,
                            ),
                            Text(
                              list[index].unit,
                              style: TextStyle(
                                  fontSize: 14.w,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ))),
                        TextButton(
                            onPressed: () {
                              addItemToCardController.increment();
                              // addItemToCardController.itemsincart.add(
                              //   FeaturedItems(
                              //       featureditems[index].image,
                              //       featureditems[index].label,
                              //       featureditems[index].price,
                              //       featureditems[index].unit,
                              //       featureditems[index].id)
                              // );
                              addItemToCardController.additem(
                                  featureditems[index].image,
                                  featureditems[index].label,
                                  featureditems[index].price,
                                  featureditems[index].unit,
                                  featureditems[index].id);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      top: BorderSide(
                                          width: 1.sp, color: Colors.grey))),
                              padding: EdgeInsets.all(5.w),
                              child: Padding(
                                  padding: EdgeInsets.all(5.sp),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.shopping_cart_outlined,
                                        color: Colors.green[500],
                                        size: 25.sp,
                                      ),
                                      Text(
                                        "Add to Cart",
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.black),
                                      )
                                    ],
                                  )),
                            )),
                      ],
                    ),
                    elevation: 5,
                  );
                },
              ));
        });
  }
}
