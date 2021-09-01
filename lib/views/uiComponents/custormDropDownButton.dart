import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustormDropDown extends StatefulWidget {
  const CustormDropDown(
      {Key? key,
      required this.label,
      required this.chosenValue,
      required this.items,
      required this.hint,
      required this.onChanged})
      : super(key: key);
  final String chosenValue;
  final String label;
  final List<String> items;
  final String hint;
  final void Function(String? value) onChanged;
  @override
  _CustormDropDownState createState() => _CustormDropDownState();
}

class _CustormDropDownState extends State<CustormDropDown> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            widget.label,
            style: GoogleFonts.dmSans(
                fontSize: 16.0, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      SizedBox(
        height: 50.0,
        child: Container(
           decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.grey[300]),
          padding: EdgeInsets.all(12.0),
          child: DropdownButton<String>(
              focusColor: Colors.white,
              value: widget.chosenValue,
              isExpanded: true,
              underline: Container(),
              style: TextStyle(color: Colors.white),
              iconEnabledColor: Colors.black,
              items: widget.items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
              hint: Text(
                widget.hint,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              onChanged: widget.onChanged),
        ),
      ),
    ]);
  }
}
