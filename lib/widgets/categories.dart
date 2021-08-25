import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Category extends StatelessWidget {
  final List category = [
    [Icons.face, Colors.grey, "food"],
    [Icons.power_off, Colors.blue, "Fruit"],
    [Icons.h_mobiledata, Colors.red, "food"],
    [Icons.car_rental_outlined, Colors.green, "Fruit"],
    [Icons.card_giftcard, Colors.red, "food"],
    [Icons.ac_unit, Colors.amber, "Fruit"],
    [Icons.ac_unit, Colors.red, "food"],
    [Icons.ac_unit, Colors.amber, "Fruit"],
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
        height: 120.sp,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(10.sp),
              child: Column(
                children: [
                  Material(
                      child: InkWell(
                          splashColor: category[index][1][200],
                          onTap: () {
                            print("hi");
                          },
                          child: CircleAvatar(
                            radius: (35.sp),
                            child: Icon(
                              category[index][0],
                              color: Colors.white,
                              size: 35.sp,
                            ),
                            backgroundColor: category[index][1],
                          ))),
                  Text(
                    category[index][2],
                    style: TextStyle(fontSize: 15.sp),
                  )
                ],
              ),
            );
          },
          itemCount: category.length,
        ));
  }
}
