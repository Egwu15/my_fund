import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_fund/controller/auth.dart';
import 'package:my_fund/controller/storage.dart';
import 'package:my_fund/controller/user.dart';
import 'package:my_fund/models/userModel.dart';
import 'package:my_fund/views/uiComponents/colors.dart';
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
              height: 130,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                  color: deepPurple),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Wallet",
                      style: GoogleFonts.nunitoSans(
                          fontWeight: FontWeight.w700,
                          fontSize: 16.0,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Obx(
                      () => Text(
                        "₦${userData.walletBalance.string}",
                        style: GoogleFonts.nunitoSans(
                            fontWeight: FontWeight.w700,
                            fontSize: 16.0,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
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
