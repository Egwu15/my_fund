import 'package:flutter/material.dart';
class Badge extends StatelessWidget {
  const Badge({Key? key, required this.counter}) : super(key: key);
  final int counter;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        new IconButton(icon: Icon(Icons.notifications_outlined, color: Colors.black,), onPressed: () {}),
        counter != 0
            ? new Positioned(
                right: 11,
                top: 11,
                child: new Container(
                  padding: EdgeInsets.all(2),
                  decoration: new BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  child: Text(
                    '$counter',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            : new Container()
      ],
    );
  }
}
