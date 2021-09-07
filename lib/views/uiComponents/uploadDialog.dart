import 'package:flutter/material.dart';

import 'package:get/route_manager.dart';
import 'package:my_fund/controller/kyc.dart';

Kyc kyc = Kyc();
late String imageUploadPath;
uploadImage() async {
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
                   imageUploadPath = await kyc.getDocFromGallary();
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
                    
                    
                    
                    imageUploadPath = await kyc.getDocFromCamera();
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
