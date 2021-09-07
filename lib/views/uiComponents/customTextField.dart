import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

custormTextFieldOutlined(
    {String label = "label",
    required TextEditingController controller,
    TextInputType keybord = TextInputType.text,
    bool obscureText = false,
    bool enabled = true}) {
  return Column(
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            label,
            style:
                GoogleFonts.dmSans(fontSize: 16.0, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      SizedBox(
        height: 50.0,
        child: TextFormField(
          keyboardType: keybord,
          controller: controller,
          cursorColor: Colors.deepPurple,
          obscureText: obscureText,
          enabled: enabled,
          style:
              GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.w400),
        ),
      ),
    ],
  );
}

custormTextField(
    {String label = "label",
    required TextEditingController controller,
    TextInputType keybord = TextInputType.text,
    bool obscureText = false,

    bool enabled = true}) {
  return Column(
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            label,
            style:
                GoogleFonts.dmSans(fontSize: 16.0, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      SizedBox(
        height: 50.0,
        child: TextFormField(
          keyboardType: keybord,
          controller: controller,
          // validator: ,
          cursorColor: Colors.deepPurple,
          obscureText: obscureText,
          enabled: enabled,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[300],
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15),
              )),
          style:
              GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.w400),
        ),
      ),
    ],
  );
}
