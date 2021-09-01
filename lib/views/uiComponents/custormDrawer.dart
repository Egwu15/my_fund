import 'package:fancy_drawer/fancy_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_fund/controller/auth.dart';
import 'package:my_fund/views/sideBarPages.dart/profilePage.dart';

Widget custormAppDrawer({
  required FancyDrawerController controller,
  required Widget scaffold,
}) {
  return Material(
    color: Colors.transparent,
    child: FancyDrawerWrapper(
      backgroundColor: Color(0xff30004A), // Drawer background
      controller: controller, // Drawer controller
      drawerItems: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              fancyDrawerTIle(
                  text: "Profile",
                  icon: Icons.account_circle_outlined,
                  action: () => Get.to(() => ProfilePage())),
              line(),
              fancyDrawerTIle(
                  text: "WealthMap",
                  icon: Icons.add_shopping_cart_outlined,
                  action: () {}),
              line(),
              fancyDrawerTIle(
                text: "ValuePlus",
                icon: Icons.local_offer_outlined,
                action: () {},
              ),
              line(),
              fancyDrawerTIle(
                  text: "Loan",
                  icon: Icons.description_outlined,
                  action: () {}),
              line(),
              fancyDrawerTIle(
                  text: "Home", icon: Icons.security_outlined, action: () {}),
              line(),
              fancyDrawerTIle(
                text: "Log out",
                icon: Icons.logout_outlined,
                action: () => Auth().logout(),
              ),
            ],
          ),
        ),
      ], // Drawer items
      child: scaffold, // Your app content
    ),
  );
}

Widget fancyDrawerTIle(
    {required String text, required IconData icon, required Function action}) {
  return TextButton.icon(
    style: TextButton.styleFrom(backgroundColor: Colors.transparent),
    label: Text(
      text,
      style: GoogleFonts.inter(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    onPressed: () {
      action();
    },
    icon: Icon(icon, color: Colors.white),
  );
}

Widget line() {
  return Padding(
    padding: EdgeInsets.only(
        left: 39.0, right: Get.width * 0.45, top: 4.0, bottom: 4.0),
    child: Divider(
      height: 1,
      color: Colors.grey,
    ),
  );
}

