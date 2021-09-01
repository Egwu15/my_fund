import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget profileButtonTile(
    {Widget icon = const Icon(Icons.widgets),
    required String text,
    required Function action}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20.0),
    child: InkWell(
      onTap: () => action(),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Row(
            children: [
              icon,
              SizedBox(
                width: 30.0,
              ),
              Text(
                text,
                style: GoogleFonts.nunitoSans(
                    fontWeight: FontWeight.w700, fontSize: 18.0),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
