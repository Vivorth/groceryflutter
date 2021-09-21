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

class ItemListView extends StatelessWidget {
  final AddItemToCardController addItemToCardController =
      Get.put(AddItemToCardController());
  final DataController data = Get.put(DataController());
  late final String type;
  ItemListView(this.type);

  @override
  Widget build(BuildContext context) {
    double textscalefactor = MediaQuery.of(context)
        .textScaleFactor; //in case they change fontsize in settings of their system

    double width = MediaQuery.of(context).size.width;

    return FutureBuilder(
        future: type == "New" ? data.New() : data.featured(),
        builder: (context, AsyncSnapshot<List<ProductModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          final featureditems = snapshot.data!;
          return Padding(
              padding: EdgeInsets.all(10.w),
              child: Container(
                height: 185.w,
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
                                  image:
                                      NetworkImage(featureditems[index].image),
                                  height: 60.w),
                              SizedBox(
                                height: 10.w,
                              ),
                              Text(
                                '\$${featureditems[index].price.toStringAsFixed(2)}',
                                style: TextStyle(
                                    fontSize:
                                        12.w, // /350 to make responsive text
                                    color: Colors.green[500],
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                featureditems[index].name,
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
                                    fontSize: 12.w,
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
                                    featureditems[index].name,
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
                                    padding: EdgeInsets.only(
                                        left: 14.w, right: 14.w, top: 10.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
        });
  }
}
