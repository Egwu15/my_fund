import 'dart:convert';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_fund/controller/accountsController.dart';
import 'package:my_fund/controller/auth.dart';
import 'package:my_fund/controller/profileStorage.dart';
import 'package:my_fund/controller/user.dart';

import 'package:my_fund/views/uiComponents/colors.dart';
import 'package:my_fund/views/uiComponents/contentCarousel_slider.dart';
import 'package:my_fund/views/uiComponents/greetings.dart';
import 'package:my_fund/views/uiComponents/todoListCard.dart';

class Myfund extends StatefulWidget {
  const Myfund({Key? key}) : super(key: key);

  @override
  _MyfundState createState() => _MyfundState();
}

class _MyfundState extends State<Myfund> {
  @override
  Widget build(BuildContext context) {
    final UserData userData = Get.put(UserData());
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => Text(
                "Welcome\nGood ${greeting()}  ${userData.userFullName.string}.",
                style: GoogleFonts.nunitoSans(
                    fontSize: 15, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(17.0),
                  ),
                  color: Colors.blueAccent),
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Icon(Icons.drive_folder_upload_outlined),
                      SizedBox(
                        width: 8.0,
                      ),
                      Flexible(
                        child: Text(
                          " You are 57% to being to Top Saver for month of July.\nCurrent Top Saver: Adeolu34",
                          style: GoogleFonts.nunitoSans(
                              fontSize: 15.0, fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  )),
            ),
            SizedBox(
              height: 15.0,
            ),
             ContentCarousel(),

            SizedBox(
              height: 17.0,
            ),
            Text(
              "To-do List",
              style: GoogleFonts.nunitoSans(
                  fontWeight: FontWeight.w700, fontSize: 16.0),
            ),
            SizedBox(
              height: 15.0,
            ),
            todoListCard(
                icon: Icons.folder_open_outlined,
                text: "KYC Form here",
                action: () {}),
            todoListCard(
                icon: Icons.credit_card_outlined,
                text: "Check Financial Status ",
                action: () {}),
            todoListCard(
                icon: Icons.widgets_outlined,
                text: "Refer and earn",
                action: () {}),
            todoListCard(
                icon: Icons.leaderboard_outlined,
                text: "Extra Income",
                action: () {}),
            // Row(
            //   children: [
            //     TextButton(
            //       onPressed: () => UserData().fetchUser(),
            //       child: Text("user"),
            //     ),
            //     TextButton(
            //       onPressed: () => UserData().fetchWalletBalance(),
            //       child: Text("wallet"),
            //     ),
            //     TextButton(
            //       onPressed: () => userData.increment(),
            //       child: Obx(() => Text(userData.count.string)),
            //     ),
            //   ],
            // ),
            // Obx(() => Text(
            //       userData.userEmail.string,
            //       softWrap: true,
            //     )),
          ],
        ),
      ),
    );
  }
}
