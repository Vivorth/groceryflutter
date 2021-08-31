import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Category extends StatelessWidget {
  final List category = [
    [Icons.fastfood_outlined, Colors.grey, "Food"],
    [Icons.power_off, Colors.blue, "Fruit"],
    [Icons.local_grocery_store, Colors.red, "Food"],
    [Icons.electric_moped_outlined, Colors.green, "Fruit"],
    [Icons.card_giftcard, Colors.red, "Food"],
    [Icons.ac_unit, Colors.amber, "Fruit"],
    [Icons.ac_unit, Colors.red, "Food"],
    [Icons.ac_unit, Colors.amber, "Fruit"],
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
        height: 105.w,
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
                            radius: (30.w),
                            child: Icon(
                              category[index][0],
                              color: Colors.white,
                              size: 30.w,
                            ),
                            backgroundColor: category[index][1],
                          ))),
                  Text(
                    category[index][2],
                    style:
                        TextStyle(fontSize: 18.w, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            );
          },
          itemCount: category.length,
        ));
  }
}
