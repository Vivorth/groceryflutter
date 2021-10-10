import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceryflutter/controllers/additemstocart.dart';
import 'package:get/get.dart';
import 'package:groceryflutter/controllers/dataController.dart';
import 'package:groceryflutter/models/category.dart';
import 'package:groceryflutter/screens/featuredexpand.dart';

class Category extends StatelessWidget {
  final AddItemToCardController addItemToCardController =
      Get.put(AddItemToCardController());

  final DataController dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var str = "grey";

    return FutureBuilder(
      future: dataController.categoires(),
      builder: (context, AsyncSnapshot<List<CategoryModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // to check when data is still loading
          //to prevent from red screen
          return SizedBox(
              height: 105.w,
              child: Center(
                  child: dataController.checkplatform() == "IOS"
                      ? const CupertinoActivityIndicator()
                      : const CircularProgressIndicator(
                          color: Color(0xFF2CB064),
                        )));
        }
        var list = snapshot.data;
        if (list != null) {
          return Container(
              height: 105.w,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  String type = list[index].label;
                  final String name = type;

                  if (type.contains(" ")) {
                    // need to replace space with "-" coz we pass this to url=> url only supports "-"
                    type = type.replaceAll(" ", "-");
                  }

                  return Container(
                    margin: EdgeInsets.all(10.sp),
                    child: Column(
                      children: [
                        Material(
                            child: InkWell(
                                splashColor:
                                    Color(int.parse(list[index].color)),
                                onTap: () {
                                  Get.to(() => FeaturedExpand(type, name));
                                },
                                child: CircleAvatar(
                                  radius: (30.w),
                                  child: Icon(
                                    IconData(list[index].icon,
                                        fontFamily: 'MaterialIcons'),
                                    color: Colors.white,
                                    size: 30.w,
                                  ),
                                  backgroundColor:
                                      Color(int.parse(list[index].color)),
                                ))),
                        Text(
                          list[index].label,
                          style: TextStyle(
                              fontSize: 18.w, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  );
                },
                itemCount: list.length,
              ));
        } else {
          return Text("Nullll");
        }
      },
    );
  }
}
