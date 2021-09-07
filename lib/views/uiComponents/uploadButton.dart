import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadButton extends StatelessWidget {
  const UploadButton({Key? key, required this.action}) : super(key: key);

  final Function action;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "Upload ID Card",
              style: GoogleFonts.dmSans(
                  fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        InkWell(
          onTap: () => action(),
          child: SizedBox(
            height: 50.0,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[300]),
              padding: EdgeInsets.all(12.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Choose File"),
                    Icon(Icons.system_update_outlined)
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
