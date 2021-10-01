import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_fund/views/sideBarPages.dart/underProfile/viewCard.dart';

import 'colors.dart';

class AtmCard extends StatelessWidget {
  const AtmCard({Key? key, required this.card, required this.valid}) : super(key: key);
  final String card;
  final String valid;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => ViewCard()),
      child: Container(
        alignment: Alignment.centerLeft,
        height: 170,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
            color: deepPurple),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                card,
                style: GoogleFonts.mulish(
                    fontWeight: FontWeight.w800,
                    fontSize: 15.0,
                    color: Colors.white),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Tap to see more options.",
                style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                    color: Colors.white),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                valid,
                style: GoogleFonts.mulish(
                    fontWeight: FontWeight.w800,
                    fontSize: 15.0,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
