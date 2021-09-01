import 'package:flutter/material.dart';

Widget todoListCard(
    {required IconData icon, required String text, required Function action}) {
  return Card(
    elevation: 6.0,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(
            width: 18.0,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
          )
        ],
      ),
    ),
  );
}
