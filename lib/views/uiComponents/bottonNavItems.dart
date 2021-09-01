import 'package:flutter/material.dart';

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
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
