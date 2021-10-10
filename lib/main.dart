import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:groceryflutter/controllers/dataController.dart';
import 'package:groceryflutter/controllers/navigationController.dart';
import 'package:groceryflutter/models/user.dart';
import 'package:groceryflutter/screens/featuredexpand.dart';
import 'package:groceryflutter/screens/signin.dart';
import 'package:groceryflutter/screens/splash_screen.dart';
import 'package:groceryflutter/widgets/itemlistview.dart';
import '../widgets/categories.dart';
import 'controllers/additemstocart.dart';
import 'models/cartmodel.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: () => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              home: SplashScreen(),
              routes: <String, WidgetBuilder>{
                'SPLASHSCREEN': (BuildContext context) => SplashScreen(),
                'MAIN_SCREEN': (BuildContext context) => MyHomePage(),
              },
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
  var navigationController = Get.put(navigation());

  late String userID;
  final DataController dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    addItemToCardController.getStatusBarHeight(context);
    final storage = new FlutterSecureStorage();
    double textscalefactor = MediaQuery.of(context)
        .textScaleFactor; //in case they change fontsize in settings of their system
    checkAuth(String navigateTo) async {
      var value = await storage.read(key: 'token');
      if (value == null) {
        Get.to(() => SignIn());
        navigationController.screen = navigateTo;
      } else {
        print(value);
        navigationController.screen = navigateTo;
        navigationController.navigateTo();
      }
    }

    checkAuthHomeScreen() async {
      var value = await storage.read(key: 'token');

      print("value ${value}");
      if (value == null) {
        return false;
      } else {
        var value1 = await storage.read(key: 'userID');
        print("userID = ${value1}");
        return value1;
      }
    }

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
                padding: EdgeInsets.only(
                    top: addItemToCardController.statusbarHeight),
                color: const Color(0xFF2CB064),
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
                                          Flexible(
                                            child: Text(
                                              "Hey, San\nWelcome to Grocery Store",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18.w),
                                            ),
                                          ),
                                          InkWell(
                                              onTap: () {
                                                checkAuth("Profile");
                                              },
                                              child: FutureBuilder(
                                                future: checkAuthHomeScreen(),
                                                builder: (context, snapshot) {
                                                  if (snapshot.data == false) {
                                                    return CircleAvatar(
                                                      radius: 25.w,
                                                      child: Icon(
                                                        Icons
                                                            .account_circle_rounded,
                                                        size: 30.w,
                                                      ),
                                                    );
                                                  } else {
                                                    return FutureBuilder(
                                                        future: dataController
                                                            .userDetail(),
                                                        builder: (context,
                                                            AsyncSnapshot<User>
                                                                snapshot) {
                                                          if (snapshot
                                                                  .connectionState ==
                                                              ConnectionState
                                                                  .waiting) {
                                                            return CircleAvatar(
                                                              radius: 25.w,
                                                              child: Icon(
                                                                Icons
                                                                    .account_circle_rounded,
                                                                size: 30.w,
                                                              ),
                                                            );
                                                          }

                                                          return CircleAvatar(
                                                              radius: 25.w,
                                                              backgroundImage:
                                                                  NetworkImage(
                                                                      snapshot
                                                                          .data!
                                                                          .image));
                                                        });
                                                  }
                                                },
                                              ))
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
                ),
              ),
              floatingActionButton: Container(
                height: 80.w,
                width: 80.w,
                child: FloatingActionButton(
                    backgroundColor: const Color(0xFF2CB064),
                    onPressed: () {
                      checkAuth("Cart");
                    },
                    child: Container(
                        child: FutureBuilder(
                      future: checkAuthHomeScreen(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        }
                        return snapshot.data! != false
                            ? FutureBuilder(
                                future: dataController.getCart1(),
                                builder: (context, AsyncSnapshot snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Icon(
                                      Icons.shopping_cart,
                                      size: 30.w,
                                    );
                                  }
                                  return snapshot.data!.isNotEmpty
                                      ? Padding(
                                          padding: EdgeInsets.all(10.w),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Icon(
                                                Icons.shopping_cart,
                                                size: 30.w,
                                              ),
                                              Flexible(
                                                  child: Obx(() => Text(
                                                        snapshot.data!.length
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 20.w,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )))
                                            ],
                                          ))
                                      : Icon(
                                          Icons.shopping_cart,
                                          size: 30.w,
                                        );
                                },
                              )
                            : Icon(
                                Icons.shopping_cart,
                                size: 30.w,
                              );
                      },
                    ))),
              ),
            );
    }
  }
}
