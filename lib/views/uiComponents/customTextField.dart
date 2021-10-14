import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

custormTextFieldOutlined(
    {String label = "label",
    initialValue,
    controller,
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
          initialValue: initialValue,
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
    bool enabled = true,
     onChanged
    }) {
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
          onChanged: onChanged,
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

Widget outlinedTransparentField(
    
    {
      required String text,
      required String hint,
    required TextEditingController controller,
    required List<TextInputFormatter> inputFormatters}) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text(
      text,
      style: GoogleFonts.mulish(
          fontWeight: FontWeight.w800, fontSize: 12.0, color: Colors.grey),
    ),
    SizedBox(
      height: 11.0,
    ),
    SizedBox(
      height: 50.0,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        inputFormatters: inputFormatters,
        //  [
        //   FilteringTextInputFormatter.digitsOnly,

        //   CustomInputFormatter()
        // ],
        decoration: InputDecoration(
          hintText: hint,
          fillColor: Colors.transparent,
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 2.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    )
  ]);
}

class CustomInputSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = new StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write(
            ' '); // Replace this with anything you want to put after each 4 numbers
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: new TextSelection.collapsed(offset: string.length));
  }
}
class CustomInputSlashFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = new StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != text.length) {
        buffer.write(
            '/'); // Replace this with anything you want to put after each 4 numbers
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: new TextSelection.collapsed(offset: string.length));
  }
}
