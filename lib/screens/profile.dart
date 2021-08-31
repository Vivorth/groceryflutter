import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Text("Profile detail and settings"),
          ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text("Back"))
        ]),
      ),
    );
  }
}
