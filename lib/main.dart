import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:groceryflutter/screens/featuredexpand.dart';
import 'package:groceryflutter/screens/profile.dart';
import 'package:groceryflutter/screens/signin.dart';
import 'package:groceryflutter/screens/signup.dart';
import 'package:groceryflutter/widgets/cart.dart';
import 'package:groceryflutter/widgets/featuredgrid.dart';
import 'package:groceryflutter/widgets/itemlistview.dart';
import '../widgets/categories.dart';
import 'controllers/additemstocart.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: () => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              home: MyHomePage(),
            ),
        designSize: const Size(414, 896)); //screensize of adobexd or figma
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final AddItemToCardController addItemToCardController =
      Get.put(AddItemToCardController());

  List<Map<String, Object>> categories = [
    {"color": Colors.red, "icon": Icons.ac_unit_outlined, "label": Text("food")}
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    addItemToCardController.getStatusBarHeight(context);

    double textscalefactor = MediaQuery.of(context)
        .textScaleFactor; //in case they change fontsize in settings of their system
    if (width >= 768 && width < 1440) {
      return const Scaffold(
        body: SafeArea(
          child: Text("Hello from Tablet"),
        ),
      );
    } else {
      return width >= 1440
          ? Scaffold(body: const SafeArea(child: Text("Hello from Desktop")))
          : Scaffold(
              body: Container(
                color: const Color(0xFF2CB064),
                child: SafeArea(
                    child: SingleChildScrollView(
                  child: Container(
                    decoration: const BoxDecoration(color: Color(0xFF2CB064)),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 185.w,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFF6F7FA),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(40.sp))),
                            ),
                            Container(
                              height: 185.w,
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF2CB064),
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(40.sp))),
                                  padding: EdgeInsets.only(
                                      left: 20.w,
                                      right: 20.w,
                                      top: 20.w,
                                      bottom: 20.w),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Hey, San\nThis is the width: ${width}, ${height}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.w),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Get.to(() => const ProfileInfo());
                                            },
                                            child: CircleAvatar(
                                                radius: 25.w,
                                                backgroundImage: const NetworkImage(
                                                    "https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.6435-9/91613065_1085188218540708_8401485879616471040_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=174925&_nc_eui2=AeEVelAm_fSfWhXVvvFUIKBM0FkEwpT1uHDQWQTClPW4cDlQN1XFhiP82bzFSJLFXKpmsjuydQMyvea9v0aly1kC&_nc_ohc=ypvfxQq-rqgAX8eU5bs&_nc_ht=scontent.fpnh1-2.fna&oh=a9a89615a4a32cb6e59fcd28ef454003&oe=61505629")),
                                          ),
                                        ],
                                      ),
                                      Container(
                                          height: 52.w,
                                          child: TextField(
                                              decoration: InputDecoration(
                                            fillColor: Colors.white,
                                            filled: true,
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFFFFFFF),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.w)),
                                            labelText: 'Search',
                                            labelStyle:
                                                TextStyle(fontSize: 15.w),
                                            hintText:
                                                'Search your Grocery food',
                                            hintStyle: TextStyle(
                                              fontSize: 15.w,
                                            ),
                                            prefixIcon: Icon(
                                              Icons.search,
                                              size: 30.w,
                                            ),
                                          )))
                                    ],
                                  )),
                            ),
                          ],
                        ),
                        Container(
                            padding: EdgeInsets.only(bottom: 10.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40.w),
                              ),
                              color: const Color(0xFFF6F7FA),
                            ),
                            child: Column(
                              children: [
                                Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10.w, horizontal: 15.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "Categories",
                                          style: TextStyle(
                                              fontSize: 24.w,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            Get.to(() => SignIn());
                                          },
                                          icon: Icon(Icons.arrow_forward),
                                          iconSize: 30.w,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    )),
                                Category(),
                                Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 15.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "Featured Products",
                                          style: TextStyle(
                                              fontSize: 24.w,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            Get.to(() => FeaturedExpand(
                                                "Featured",
                                                "Featured Products"));
                                          },
                                          icon: Icon(Icons.arrow_forward),
                                          iconSize: 30.w,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    )),
                                ItemListView("Featured"),
                                Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 15.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "Recently Added Products",
                                          style: TextStyle(
                                              fontSize: 24.w,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            Get.to(() => FeaturedExpand("New",
                                                "Recently Added Products"));
                                          },
                                          icon: Icon(Icons.arrow_forward),
                                          iconSize: 30.w,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    )),
                                ItemListView("New"),
                                SizedBox(height: 50.w)
                              ],
                            )),
                      ],
                    ),
                  ),
                )),
              ),
              floatingActionButton: Container(
                height: 80.w,
                width: 80.w,
                child: FloatingActionButton(
                  backgroundColor: const Color(0xFF2CB064),
                  onPressed: () {
                    Get.to(() => Cart());
                  },
                  child: Container(
                      child: Obx(
                    () => addItemToCardController.numberofitems > 0
                        ? Padding(
                            padding: EdgeInsets.all(10.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.shopping_cart,
                                  size: 30.w,
                                ),
                                Flexible(
                                    child: Text(
                                  addItemToCardController.numberofitems
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 20.w,
                                      fontWeight: FontWeight.bold),
                                ))
                              ],
                            ),
                          )
                        : Icon(
                            Icons.shopping_cart,
                            size: 30.w,
                          ),
                  )),
                ),
              ),
              // bottomNavigationBar: Material(
              //   color: Colors.transparent,
              //   elevation: 30,
              //   child: Container(
              //     decoration: BoxDecoration(
              //         color: Colors.white,
              //         borderRadius: BorderRadius.only(
              //           topLeft: Radius.circular(20.w),
              //           topRight: Radius.circular(20.w),
              //         )),
              //     width: double.infinity,
              //     height: 80.w,
              //     child: Row(
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       mainAxisAlignment: MainAxisAlignment.spaceAround,
              //       children: [
              //         Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Obx(() => Text(
              //                   "\$${addItemToCardController.totalprice.toStringAsFixed(2)}", //2 decimal places
              //                   style: TextStyle(
              //                       fontSize: 25.w,
              //                       fontWeight: FontWeight.bold),
              //                 )),
              //             SizedBox(
              //               height: 5.w,
              //             ),
              //             Text(
              //               "Total Price",
              //               style: TextStyle(fontSize: 15.w),
              //             )
              //           ],
              //         ),
              //         Container(
              //           margin: EdgeInsets.only(left: 60.w),
              //           child: TextButton(
              //               onPressed: () {},
              //               child: Container(
              //                 width: 150.w,
              //                 height: 45.w,
              //                 decoration: BoxDecoration(
              //                     color: const Color(0xFF2CB064),
              //                     borderRadius:
              //                         BorderRadius.all(Radius.circular(15.w))),
              //                 child: Center(
              //                     child: Text(
              //                   "Buy Now",
              //                   style: TextStyle(
              //                       fontSize: 16.w,
              //                       color: Colors.white,
              //                       fontWeight: FontWeight.bold),
              //                 )),
              //               )),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
            );
    }
  }
}
