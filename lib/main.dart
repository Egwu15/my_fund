import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_fund/views/onbording.dart';


Future main() async {
  await Hive.initFlutter();
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          textTheme: TextTheme(
              headline1: GoogleFonts.dmSans(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.deepPurple),
              bodyText1: GoogleFonts.inter(
                  fontWeight: FontWeight.w400, fontSize: 18.0)),
          primarySwatch: Colors.deepPurple,
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.grey[300],
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurple, width: 2.0),
              borderRadius: BorderRadius.circular(15),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurple),
              borderRadius: BorderRadius.circular(15),
            ),
          )),
      home: OnbordingScreen(),
    );
  }
}
