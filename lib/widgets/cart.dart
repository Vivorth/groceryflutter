import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceryflutter/widgets/cart_cardview.dart';
import '../controllers/additemstocart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cart extends StatelessWidget {
  Cart({Key? key}) : super(key: key);

  final AddItemToCardController addItemToCardController =
      Get.put(AddItemToCardController());
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    //initilize first before use it in each screen
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(414, 896),
        orientation: Orientation.portrait);
    return Scaffold(
      // appBar: AppBar(
      //   title: Center(
      //     child: Text("hi"),
      //   ),
      // ),
      body: SafeArea(
          child: SingleChildScrollView(
        //in here cannot put directly to stack

        child: Container(
          decoration: BoxDecoration(color: Color(0xFF2CB064)),
          child: Column(
            //we use column so stack and listview are seperated.
            children: [
              Stack(children: [
                Container(
                  height: 80.w,
                  decoration: BoxDecoration(
                      color: Color(0xFFF6F7FA),
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(40.w))),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 80.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(40.w),
                    ),
                    color: Color(0xFF2CB064),
                  ),
                  child: Text(
                    "Cart",
                    style: TextStyle(
                        fontSize: 30.w,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
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
                child: const CartCardView(),
              ),
            ],
          ),
        ),
      )),
      bottomNavigationBar: Material(
        color: Colors.transparent,
        elevation: 30,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.w),
                topRight: Radius.circular(20.w),
              )),
          width: double.infinity,
          height: 80.w,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() => Text(
                        "\$${addItemToCardController.totalprice.toStringAsFixed(2)}", //2 decimal places
                        style: TextStyle(
                            fontSize: 25.w, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 5.w,
                  ),
                  Text(
                    "Total Price",
                    style: TextStyle(fontSize: 15.w),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 60.w),
                child: TextButton(
                    onPressed: () {},
                    child: Container(
                      width: 150.w,
                      height: 45.w,
                      decoration: BoxDecoration(
                          color: const Color(0xFF2CB064),
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.w))),
                      child: Center(
                          child: Text(
                        "Buy Now",
                        style: TextStyle(
                            fontSize: 16.w,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
