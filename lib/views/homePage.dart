import 'package:fancy_drawer/fancy_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_fund/controller/auth.dart';
import 'package:my_fund/controller/kyc.dart';
import 'package:my_fund/views/bottomNavPages/myFund.dart';
import 'package:my_fund/views/uiComponents/badge.dart';
import 'package:my_fund/views/uiComponents/bottonNavItems.dart';
import 'package:my_fund/views/uiComponents/customButton.dart';
import 'package:my_fund/views/uiComponents/custormDrawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late FancyDrawerController _controller;
  int _currentIndex = 0;
  final List<Widget> _children = [
    Myfund(),
    PlaceholderWidget(Colors.deepOrange),
    PlaceholderWidget(Colors.green),
    PlaceholderWidget(Colors.pink),
    PlaceholderWidget(Colors.deepOrange),
    PlaceholderWidget(Colors.green)
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    _controller = FancyDrawerController(
        vsync: this, duration: Duration(milliseconds: 250))
      ..addListener(() {
        setState(() {}); // Must call setState
      }); // This chunk of code is important
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return custormAppDrawer(
      controller: _controller,
      scaffold: Scaffold(floatingActionButton: FloatingActionButton(onPressed: ()=>Kyc().viewKyc(),),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            actions: [Badge(counter: 3)],
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {
                _controller.toggle();
              },
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: onTabTapped,
            elevation: 0,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black,
            currentIndex: _currentIndex,
            showUnselectedLabels: true,
            selectedFontSize: 15.0,

            // unselectedLabelStyle: GoogleFonts.dmSans(color: Colors.black),
            // selectedLabelStyle: GoogleFonts.dmSans(color: Colors.black),
            selectedIconTheme: IconThemeData(color: Colors.purple),
            // this will be set when a new tab is tapped
            items: [
              navBarItem(Icons.home_outlined, "MyFund"),
              navBarItem(Icons.save_outlined, "Save"),
              navBarItem(Icons.credit_card_outlined, "Invest"),
              navBarItem(Icons.poll_outlined, "WLA"),
              navBarItem(Icons.home_repair_service_outlined, "More"),
            ],
          ),
          body: _children[_currentIndex]),
    );
  }
}
