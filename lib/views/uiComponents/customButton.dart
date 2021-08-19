import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget custormButton({required String text, required Function action}) {
  return SizedBox(
    width: double.infinity,
    height: 50.0,
    child: ElevatedButton(
      
      onPressed: ()=>action(),
      child: Text(text,
          style: GoogleFonts.inter(fontWeight: FontWeight.w700)),
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0))),
    ),
  );
}
