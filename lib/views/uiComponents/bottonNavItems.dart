import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          "coming soon!",
          style: GoogleFonts.dmSans(
              fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    );
  }
}

navBarItem(IconData icon, String label) {
  return BottomNavigationBarItem(
    activeIcon: Icon(
      icon,
      color: Colors.purple,
    ),
    icon: new Icon(
      icon,
      color: Colors.grey[800],
    ),
    label: label,
  );
}
