import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_fund/controller/user.dart';
import 'package:my_fund/views/uiComponents/colors.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:my_fund/views/uiComponents/customButton.dart';

class BankSettings extends StatelessWidget {
  const BankSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserData userData = Get.find();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: false,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.deepPurple),
        title: Text(
          "Bank Settings",
          style:
              Theme.of(context).textTheme.headline1!.copyWith(fontSize: 20.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Column(
          children: [
            Text(
              "This is where funds you have saved on Myfund will be sent to when you initiate a withdrawal.",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0),
            ),
            SizedBox(
              height: 20.0,
            ),
            Column(
              children: [
                Container(
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                      color: Colors.deepPurple),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => Text(
                            userData.userFullName.string,
                            style: GoogleFonts.nunitoSans(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Obx(
                          () => Text(
                            userData.account.string,
                            style: GoogleFonts.nunitoSans(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Obx(
                          () => Text(
                            userData.bank.string,
                            style: GoogleFonts.nunitoSans(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 35.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      custormButton(text: "UPDATE BANK", action: () {}),
                      SizedBox(height: 15.0),
                      SizedBox(
                        width: double.infinity,
                        height: 50.0,
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                side:
                                    BorderSide(color: Colors.blue, width: 1.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0))),
                            onPressed: ()=>Get.back(),
                            child: Text("CLOSE", style: GoogleFonts.inter(fontWeight: FontWeight.w700),)),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
