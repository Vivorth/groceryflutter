import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:groceryflutter/controllers/additemstocart.dart';
import 'package:groceryflutter/controllers/dataController.dart';
import 'package:groceryflutter/screens/cart.dart';
import 'package:groceryflutter/widgets/cart_cardview.dart';
import 'package:groceryflutter/widgets/featuredgrid.dart';

class FeaturedExpand extends StatelessWidget {
  final AddItemToCardController addItemToCardController =
      Get.put(AddItemToCardController());

  final DataController dataController = Get.put(DataController());
  late final String type, name;
  FeaturedExpand(this.type, this.name);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // initilize first before use it in each screen
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(414, 896),
        orientation: Orientation.portrait);
    return Scaffold(
      body: Container(
        color: const Color(0xFF2CB064),
        child: SingleChildScrollView(
          //in here cannot put directly to stack

          child: Container(
            padding:
                EdgeInsets.only(top: addItemToCardController.statusbarHeight),
            decoration: BoxDecoration(color: Color(0xFF2CB064)),
            child: Column(
              //we use column so stack and listview are seperated.
              children: [
                Stack(children: [
                  Container(
                    height: 80.w,
                    decoration: BoxDecoration(
                        color: Color(0xFFF6F7FA),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40.w))),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 80.w,
                    padding:
                        EdgeInsets.only(left: width * 0.2, right: width * 0.2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(40.w),
                      ),
                      color: Color(0xFF2CB064),
                    ),
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        "${name}",
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 26.w,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 80.w,
                    margin: EdgeInsets.only(left: 30.w),
                    child: Material(
                        color: Colors.transparent,
                        shape: CircleBorder(),
                        clipBehavior: Clip.hardEdge,
                        child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(Icons.arrow_back_ios,
                              color: Colors.white, size: 30.w),
                        )),
                  )
                ]),
                Container(
                  padding: EdgeInsets.only(top: 12.w, left: 12.w, right: 12.w),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(40.w)),
                      color: Color(0xFFF6F7FA)),
                  //child: SingleChildScrollView(
                  //put scrollview here coz it has some problems when we put it before stack
                  child: FeaturedGrid(type),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
          height: 85.sp,
          width: 85.sp,
          child: FloatingActionButton(
            backgroundColor: const Color(0xFF2CB064),
            onPressed: () {
              Get.to(() => Cart());
            },
            child: Container(
                child: Obx(
              () => addItemToCardController.numberofitems > 0
                  ? Padding(
                      padding: EdgeInsets.all(10.sp),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.shopping_cart,
                            size: 30.sp,
                          ),
                          Flexible(
                              child: Text(
                            addItemToCardController.numberofitems.toString(),
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.bold),
                          ))
                        ],
                      ),
                    )
                  : Icon(
                      Icons.shopping_cart,
                      size: 30.sp,
                    ),
            )),
          )),
    );
  }
}
