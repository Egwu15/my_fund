import 'package:flutter/material.dart';

import 'package:get/route_manager.dart';
import 'package:my_fund/controller/profilePictureController.dart';

ProfilePictureController profilePictureController = ProfilePictureController();
uploadProfileImage() async {
  Get.dialog(
    Scaffold(
      backgroundColor: Colors.white.withOpacity(0.2),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: Get.height * 0.10,
              width: Get.width * 0.80,
              child: Card(
                elevation: 3.0,
                child: TextButton(
                  onPressed: () async {
                    profilePictureController.getDocFromGallary();
                    Get.back();
                  },
                  child: Text(
                    'Upload from gallary',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
              ),
            ),
            Container(
              height: Get.height * 0.10,
              width: Get.width * 0.80,
              child: Card(
                elevation: 3.0,
                child: TextButton(
                  onPressed: () async {
                    profilePictureController.getDocFromCamera();
                    Get.back();
                  },
                  child: Text(
                    'Open camera',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
