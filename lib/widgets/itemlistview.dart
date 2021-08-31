import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/additemstocart.dart';
import '../models/featureditems.dart';

class ItemListView extends StatelessWidget {
  final AddItemToCardController addItemToCardController =
      Get.put(AddItemToCardController());
  final List<FeaturedItems> featureditems = [
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

    double width = MediaQuery.of(context).size.width;
    return Padding(
        padding: EdgeInsets.all(10.w),
        child: Container(
          height: 175.w,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: featureditems.length,
            // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //     childAspectRatio: 0.8, crossAxisCount: 2, crossAxisSpacing: 5),
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
                            image: AssetImage(
                                'assets/${featureditems[index].image}.png'),
                            height: 60.w),
                        Text(
                          '\$${featureditems[index].price.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontSize: 10.w, // /350 to make responsive text
                              color: Colors.green[500],
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          featureditems[index].label,
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 18.w,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          featureditems[index].unit,
                          style: TextStyle(
                              fontSize: 10.w,
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
                                      width: 1.w, color: Colors.grey))),
                          child: Padding(
                              padding: EdgeInsets.all(5.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.shopping_cart_outlined,
                                    color: Colors.green[500],
                                    size: 18.w,
                                  ),
                                  Text(
                                    "Add to Cart",
                                    style: TextStyle(
                                        fontSize: 14.w,
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
          ),
        ));
  }
}
