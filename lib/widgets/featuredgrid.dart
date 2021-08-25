import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeaturedGrid extends StatelessWidget {
  final List data = [
    {
      "image": "tomato",
      "label": "Tomato",
      "price": 12,
      "unit": "1kg",
    },
    {"image": "lemongrass", "label": "Lemon Grass", "price": 12, "unit": "1kg"},
    {"image": "banana", "label": "Banana", "price": 12, "unit": "1kg"},
    {"image": "milktea", "label": "Milk Tea", "price": 12, "unit": "1kg"},
    {
      "image": "tomato",
      "label": "Tomato",
      "price": 12,
      "unit": "1kg",
    },
    {"image": "lemongrass", "label": "Lemon Grass", "price": 12, "unit": "1kg"},
    {"image": "banana", "label": "Banana", "price": 12, "unit": "1kg"},
    {"image": "milktea", "label": "Milk Tea", "price": 12, "unit": "1kg"},
    {
      "image": "tomato",
      "label": "Tomato",
      "price": 12,
      "unit": "1kg",
    },
    {"image": "lemongrass", "label": "Lemon Grass", "price": 12, "unit": "1kg"},
    {"image": "banana", "label": "Banana", "price": 12, "unit": "1kg"},
    {"image": "milktea", "label": "Milk Tea", "price": 12, "unit": "1kg"},
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
        padding: EdgeInsets.all(10.w),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: data.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.8, crossAxisCount: 2, crossAxisSpacing: 5),
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Container(
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage(
                                    'assets/${data[index]["image"]}.png'),
                                height: 80.sp,
                              ),
                              SizedBox(
                                height: 5.sp,
                              ),
                              Text(
                                '\$${data[index]["price"]}.00',
                                style: TextStyle(
                                    fontSize:
                                        12.sp, // /350 to make responsive text
                                    color: Colors.green[500],
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5.sp,
                              ),
                              Text(
                                data[index]["label"],
                                overflow: TextOverflow.fade,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 5.sp,
                              ),
                              Text(
                                data[index]["unit"],
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ))),
                  Container(
                      decoration: BoxDecoration(
                          border: Border(
                              top:
                                  BorderSide(width: 1.sp, color: Colors.grey))),
                      padding: EdgeInsets.all(5.w),
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
                                fontSize: 15.sp, fontWeight: FontWeight.w800),
                          )
                        ],
                      )),
                ],
              ),
              elevation: 5,
            );
          },
        ));
  }
}
