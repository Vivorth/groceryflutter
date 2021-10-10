import 'package:flutter/material.dart';
import 'package:groceryflutter/controllers/dataController.dart';
import 'package:groceryflutter/models/cartmodel.dart';
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
  final DataController dataController = Get.put(DataController());
  @override
  Widget build(BuildContext context) {
    var statusbar = addItemToCardController.statusbarHeight.toDouble();
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(40.w))),
      width: double.infinity,
      height: MediaQuery.of(context).size.height -
          160.w - //bottom and top navigation
          -12.w - //padding top
          10.sp -
          20.w -
          statusbar,
      child: FutureBuilder(
        future: dataController.getCart1(),
        builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: const CircularProgressIndicator());
          }
          return snapshot.data!.isEmpty
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
                            image: NetworkImage(
                                '${snapshot.data![index].productId.image}'),
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
                                Text('${snapshot.data![index].productId.name}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.w)),
                                Obx(() => Text(
                                    '\$${snapshot.data![index].productId.price.toStringAsFixed(2)} x${snapshot.data!.length}', //
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.w,
                                        color: Colors.green[500]))),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        // addItemToCardController
                                        //     .decreasecartitems(index);
                                      },
                                      child: Icon(
                                        Icons.delete_forever_outlined,
                                        color: Colors.red,
                                        size: 20.w,
                                      ),
                                    ),
                                    Obx(() => Text(
                                          '${snapshot.data!.length}',
                                          style: TextStyle(fontSize: 18.w),
                                        )),
                                    TextButton(
                                        onPressed: () {
                                          // addItemToCardController
                                          //     .increasecartitem(index);
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
                  itemCount: snapshot.data!.length,
                );
        },
      ),
    );
  }
}
