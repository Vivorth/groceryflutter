import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:groceryflutter/controllers/dataController.dart';
import 'package:groceryflutter/main.dart';
import 'package:groceryflutter/models/user.dart';

class ProfileInfo extends StatelessWidget {
  final storage = FlutterSecureStorage();
  final DataController dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    double statusbar = MediaQuery.of(context).padding.top;

    logout() async {
      await storage.write(key: 'token', value: null);
      Get.to(() => MyHomePage());
    }

    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: const Size(414, 896),
        orientation: Orientation.portrait);

    return FutureBuilder(
        future: dataController.userDetail(),
        builder: (context, AsyncSnapshot<User> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LinearProgressIndicator();
          } else {
            var user = snapshot.data!;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white54,
                elevation: 0.w,
                centerTitle: true,
                title: Text(
                  "Your Profile",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.w,
                      fontWeight: FontWeight.bold),
                ),
                leading: Container(
                  margin: EdgeInsets.only(left: 20.w, bottom: 10.w, top: 10.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.w))),
                  child: Material(
                    borderRadius: BorderRadius.all(Radius.circular(10.w)),
                    elevation: 2,
                    borderOnForeground: false,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.w),
                        ),
                      ),
                      width: 38.w,
                      height: 38.w,
                      child: IconButton(
                        iconSize: 20.w,
                        color: Colors.black,
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Get.to(() => MyHomePage());
                        },
                      ),
                    ),
                  ),
                ),
                actions: [
                  InkWell(
                    onTap: () {
                      logout();
                    },
                    child: Container(
                        margin: EdgeInsets.only(right: 20.w),
                        child: const Icon(
                          Icons.logout_outlined,
                          color: Colors.black,
                        )),
                  )
                ],
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20.w),
                    color: Colors.white54,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Container(
                          //   margin: EdgeInsets.only(bottom: 20.w),
                          //   decoration: BoxDecoration(
                          //       borderRadius:
                          //           BorderRadius.all(Radius.circular(10.w))),
                          //   child: Material(
                          //     borderRadius:
                          //         BorderRadius.all(Radius.circular(10.w)),
                          //     elevation: 1,
                          //     borderOnForeground: false,
                          //     child: Container(
                          //       decoration: BoxDecoration(
                          //         color: Colors.white54,
                          //         borderRadius: BorderRadius.all(
                          //           Radius.circular(10.w),
                          //         ),
                          //       ),
                          //       width: 38.w,
                          //       height: 38.w,
                          //       child: IconButton(
                          //         iconSize: 20.w,
                          //         icon: Icon(Icons.arrow_back_ios),
                          //         onPressed: () {
                          //           Get.back();
                          //         },
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // Text(
                          //   "Your Profile",
                          //   style: TextStyle(
                          //       fontSize: 30.w, fontWeight: FontWeight.bold),
                          // ),
                          SizedBox(
                            height: 24.w,
                          ),
                          Center(
                            child: CircleAvatar(
                              radius: 60.w,
                              backgroundImage: NetworkImage(
                                user.image,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 24.w,
                          ),
                          Text(
                            "Username:",
                            style: TextStyle(
                                fontSize: 14.w,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 15.w,
                          ),
                          Container(
                            height: 34.w,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 0.5.w, color: Colors.grey))),
                            child: Text(
                              user.name,
                              style: TextStyle(
                                  fontSize: 18.w,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 24.w,
                          ),
                          Text(
                            "Email:",
                            style: TextStyle(
                                fontSize: 16.w,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 15.w,
                          ),
                          Container(
                            height: 34.w,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 0.5.w, color: Colors.grey))),
                            child: Text(
                              user.email,
                              style: TextStyle(
                                  fontSize: 18.w,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 24.w,
                          ),
                          Text(
                            "Phone Number:",
                            style: TextStyle(
                                fontSize: 14.w,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 15.w,
                          ),
                          Container(
                            height: 34.w,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 0.5.w, color: Colors.grey))),
                            child: Text(
                              user.phoneNo,
                              style: TextStyle(
                                  fontSize: 18.w,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 24.w,
                          ),
                          Text(
                            "Address:",
                            style: TextStyle(
                                fontSize: 16.w,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 15.w,
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(bottom: 10.w),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 0.5.w, color: Colors.grey))),
                            child: Text(
                              user.address,
                              style: TextStyle(
                                  fontSize: 18.w,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            );
          }
        });
  }
}
