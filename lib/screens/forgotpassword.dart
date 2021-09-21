import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:groceryflutter/screens/signup.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
          double statusbar = MediaQuery.of(context).padding.top;

    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: const Size(414, 896),
        orientation: Orientation.portrait);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height-statusbar,
          padding: EdgeInsets.all(18.w),
          color: Colors.white54,
          child: Column(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 30.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.w))),
                  child: Material(
                    borderRadius: BorderRadius.all(Radius.circular(10.w)),
                    elevation: 1,
                    borderOnForeground: false,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.w),
                        ),
                      ),
                      width: 35.w,
                      height: 35.w,
                      child: IconButton(
                        iconSize: 20.w,
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                  ),
                ),
                Text(
                  "Forgot Password",
                  style: TextStyle(fontSize: 26.w, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16.w,
                ),
                Text(
                  "Create an account to continue",
                  style: TextStyle(
                      fontSize: 14.w,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[600]),
                ),
                SizedBox(
                  height: 20.w,
                ),
                Text(
                  "Email or Username",
                  style: TextStyle(
                      fontSize: 12.w,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w600),
                ),
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                    Icons.person_outline,
                    color: Colors.black,
                    size: 20.w,
                  )),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: Stack(children: [
                      Container(
                        width: double.infinity,
                        height: 45.w,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              //to style a button
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xFF2CB064)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.w)))),
                          child: Text(
                            "Reset Password",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16.w),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Positioned(
                        right: 10.w,
                        height: 45.w,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_forward_rounded,
                            color: Colors.white,
                            size: 20.w,
                          ),
                          onPressed: () {},
                        ),
                      )
                    ]),
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(fontSize: 14.w),
                          ),
                          TextButton(
                              onPressed: () {
                                Get.to(() => SignUp());
                              },
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                    fontSize: 14.w,
                                    color: Color(0xFF2CB064),
                                    fontWeight: FontWeight.w600),
                              ))
                        ]),
                  )
                ],
              ),
            )
          ]),
        ),
      )),
    );
  }
}
