import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:introduction_screen/introduction_screen.dart';

custormPageViewModel({title, image}) {
  return PageViewModel(
    // title: "Titssle of first page",

    titleWidget: Container(),
    image: Padding(
      padding:  EdgeInsets.symmetric(horizontal:Get.width * 0.10),
      child: SizedBox(child: Image.asset(image), height: double.infinity,),
    ),
    bodyWidget: Center(
      child: Align(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.dmSans(
            fontWeight: FontWeight.w500,
            fontSize: 20.0,
          ),
        ),
      ),
    ),
  );
}
