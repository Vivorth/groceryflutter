import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:groceryflutter/widgets/featuredgrid.dart';
import '../widgets/categories.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: () => MaterialApp(
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
  List<Map<String, Object>> categories = [
    {"color": Colors.red, "icon": Icons.ac_unit_outlined, "label": Text("food")}
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return width >= 768 && width < 1440
        ? const Scaffold(
            body: SafeArea(
              child: Text("Hello from Tablet"),
            ),
          )
        : width >= 1440
            ? Scaffold(body: const SafeArea(child: Text("Hello from Desktop")))
            : Scaffold(
                body: SafeArea(
                    child: SingleChildScrollView(
                  child: Stack(
                    children: [
                      Container(
                        color: const Color(0xFF2CB064),
                        height: height,
                      ),
                      Container(height: 171.w, color: Color(0xFFF6F7FA)),
                      Container(
                        height: 172.w,
                        child: Container(
                            decoration: BoxDecoration(
                                color: const Color(0xFF2CB064),
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(40.sp))),
                            padding: EdgeInsets.only(
                                bottom: 20.sp,
                                left: 20.sp,
                                right: 20.sp,
                                top: 20.sp),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Hey, San\nThis is the width: ${width}, ${height}",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22.sp),
                                    ),
                                    IconButton(
                                        iconSize: 40.sp,
                                        onPressed: () {},
                                        icon: CircleAvatar(
                                          child: Icon(
                                            Icons.person,
                                          ),
                                        ))
                                  ],
                                ),
                                Container(
                                    height: 60.sp,
                                    child: TextField(
                                        decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFFFFFFF),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.sp)),
                                      labelText: 'Search',
                                      labelStyle: TextStyle(fontSize: 15.sp),
                                      hintText: 'Search your Grocery food',
                                      hintStyle: TextStyle(
                                        fontSize: 15.sp,
                                      ),
                                      prefixIcon: Icon(
                                        Icons.search,
                                        size: 30.sp,
                                      ),
                                    )))
                              ],
                            )),
                      ),
                      Positioned(
                          child: Container(
                        margin: EdgeInsets.only(top: 170.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40.sp),
                          ),
                          color: Color(0xFFF6F7FA),
                        ),
                        child: Column(
                          children: [
                            Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 10.w, horizontal: 15.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Categories",
                                      style: TextStyle(
                                          fontSize: 24.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_forward),
                                      iconSize: 30.sp,
                                      color: Colors.grey,
                                    ),
                                  ],
                                )),
                            Category(),
                            Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 10.sp, horizontal: 15.sp),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Featured Products",
                                      style: TextStyle(
                                          fontSize: 24.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_forward),
                                      iconSize: 30.sp,
                                      color: Colors.grey,
                                    ),
                                  ],
                                )),
                            FeaturedGrid()
                          ],
                        ),
                      ))
                    ],
                  ),
                )),
                floatingActionButton: Container(
                  height: 70.sp,
                  width: 70.sp,
                  child: FloatingActionButton(
                    onPressed: () {},
                    child: Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          size: 30.sp,
                        ),
                        Flexible(
                            child: Text(
                          '10',
                          style: TextStyle(fontSize: 15.sp),
                        ))
                      ],
                    )),
                  ),
                ),
              );
  }
}
