import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_fund/controller/auth.dart';
import 'package:my_fund/views/uiComponents/customButton.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text("This is the home Page!",
                  style: GoogleFonts.inter(fontSize: 20.0)),
            ),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: Get.width * 0.80,
              height: 40,
              child:
                  custormButton(text: "logout", action: () => Auth().logout()),
            )
          ]),
    );
  }
}
