import 'package:flutter/material.dart';
import '../controllers/additemstocart.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartCardView extends StatefulWidget {
  const CartCardView({Key? key}) : super(key: key);

  @override
  _CartCardViewState createState() => _CartCardViewState();
}

class _CartCardViewState extends State<CartCardView> {
  final AddItemToCardController addItemToCardController =
      Get.put(AddItemToCardController());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(40.w))),
      width: double.infinity,
      height: MediaQuery.of(context).size.height -
          160.w - //bottom and top navigation
          -12.w - //padding top
          10.sp -
          20.w,
      child: Obx(
        () => addItemToCardController.itemsincart.isEmpty
            ? const Center(child: Text("No item in cart"))
            : ListView.builder(
                physics:
                    const BouncingScrollPhysics(), // to remove scroll glow and put bouncing effect

                shrinkWrap: true,
                itemBuilder: (context, index) => Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.sp)),
                  margin: EdgeInsets.all(5.sp),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.sp),
                                bottomLeft: Radius.circular(20.sp))),
                        padding: EdgeInsets.all(5.w),
                        child: Image(
                          image: AssetImage(
                              'assets/${addItemToCardController.itemsincart[index][0].image}.png'),
                          height: 80.w,
                          width: 80.w,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 90.w,
                          padding: EdgeInsets.only(left: 20.sp),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  '${addItemToCardController.itemsincart[index][0].label}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.w)),
                              Obx(() => Text(
                                  '\$${addItemToCardController.itemsincart[index][0].price} x${addItemToCardController.itemsincart[index][1]}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.w,
                                      color: Colors.green[500]))),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      addItemToCardController
                                          .decreasecartitems(index);
                                    },
                                    child: Icon(
                                      Icons.delete_forever_outlined,
                                      color: Colors.red,
                                      size: 20.w,
                                    ),
                                  ),
                                  Obx(() => Text(
                                        '${addItemToCardController.itemsincart[index][1]}',
                                        style: TextStyle(fontSize: 18.w),
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        addItemToCardController
                                            .increasecartitem(index);
                                      },
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.red,
                                        size: 20.w,
                                      )),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //     Container(
                //   child: Image(
                //     image: AssetImage(
                //         'assets/${addItemToCardController.itemsincart[index].image}.png'),
                //   ),
                // ),
                itemCount: addItemToCardController.itemsincart.length,
              ),
      ),
    );
  }
}
