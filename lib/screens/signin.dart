import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:groceryflutter/screens/forgotpassword.dart';
import 'package:groceryflutter/screens/signup.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);
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
          height: MediaQuery.of(context).size.height -
              statusbar, //need to minus status bar coz we use in safearea
          padding: EdgeInsets.all(20.w),
          color: Colors.white54,
          child: Column(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 32.w),
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
                      width: 38.w,
                      height: 38.w,
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
                  "Let's sign You In",
                  style: TextStyle(fontSize: 30.w, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 24.w,
                ),
                Text(
                  "Welcome back, you've been missed!",
                  style: TextStyle(
                      fontSize: 20.w,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[600]),
                ),
                SizedBox(
                  height: 24.w,
                ),
                Text(
                  "Email or Username",
                  style: TextStyle(
                      fontSize: 16.w,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w600),
                ),
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                    Icons.person_outline,
                    color: Colors.black,
                    size: 24.w,
                  )),
                ),
                SizedBox(
                  height: 34.w,
                ),
                Text(
                  "Password",
                  style: TextStyle(
                      fontSize: 16.w,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w600),
                ),
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Colors.black,
                        size: 24.w,
                      ),
                      suffixIcon: Icon(
                        Icons.remove_red_eye_outlined,
                        size: 24.w,
                        color: Colors.black,
                      )),
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                ),
                SizedBox(
                  height: 24.w,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.w,
                          fontWeight: FontWeight.w600),
                    ),
                    onPressed: () {
                      Get.to(() => ForgotPassword());
                    },
                  ),
                )
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
                        height: 52.w,
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
                            "Sign in",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20.w),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Positioned(
                        right: 10.w,
                        height: 52.w,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_forward_rounded,
                            color: Colors.white,
                            size: 24.w,
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
