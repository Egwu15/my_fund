import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

Widget custormButton({required String text, required Function action}) {
  return SizedBox(
    width: double.infinity,
    height: 50.0,
    child: ElevatedButton(
      onPressed: () => action(),
      child: Text(text, style: GoogleFonts.inter(fontWeight: FontWeight.w700)),
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0))),
    ),
  );
}

class CustormOutlinedButton extends StatelessWidget {
  const CustormOutlinedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.0,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.blue, width: 1.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0))),
          onPressed: () => Get.back(),
          child: Text(
            "CLOSE",
            style: GoogleFonts.inter(fontWeight: FontWeight.w700),
          )),
    );
  }
}
