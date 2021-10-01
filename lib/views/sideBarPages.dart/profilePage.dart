import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_fund/controller/auth.dart';
import 'package:my_fund/controller/user.dart';
import 'package:my_fund/views/sideBarPages.dart/underProfile/accountSettings.dart';
import 'package:my_fund/views/sideBarPages.dart/underProfile/bankSettings.dart';
import 'package:my_fund/views/sideBarPages.dart/underProfile/cardSetting.dart';
import 'package:my_fund/views/sideBarPages.dart/underProfile/contactUs.dart';
import 'package:my_fund/views/sideBarPages.dart/underProfile/kycForm.dart';
import 'package:my_fund/views/sideBarPages.dart/underProfile/loan.dart';
import 'package:my_fund/views/uiComponents/colors.dart';
import 'package:my_fund/views/uiComponents/profileButtonTile.dart';
import 'package:get/instance_manager.dart';
import 'package:my_fund/views/uiComponents/profilePicUploadDialog.dart';
import 'package:my_fund/views/uiComponents/uploadDialog.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserData userData = Get.find();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 175,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                      color: deepPurple),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: Obx(
                          () => ClipOval(
                            child: Image.network(
                              userData.picture.string,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5.0),
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
                          userData.userEmail.string,
                          style: GoogleFonts.nunitoSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                profileButtonTile(
                    text: "Account Settings",
                    action: () => Get.to(() => AccountSettings())),
                profileButtonTile(text: "Security Settings", action: () {}),
                profileButtonTile(
                    text: "Bank Settings",
                    icon: Icon(
                      Icons.account_balance_outlined,
                      color: Colors.blue,
                    ),
                    action: () => Get.to(() => BankSettings())),
                profileButtonTile(
                    text: "Card Settings",
                    action: () => Get.to(() => CardSettings())),
                profileButtonTile(text: "Chat Settings", action: () {}),
                profileButtonTile(
                    text: "Loan Transaction",
                    action: () => Get.to(() => Loan())),
                profileButtonTile(text: "FAQ", action: () {}),
                profileButtonTile(
                    text: "KYC Form here",
                    action: () => Get.to(() => KycForm())),
                profileButtonTile(
                    text: "Help", action: () => Get.to(() => ContactUs())),
                profileButtonTile(
                    text: "Logout",
                    icon: Icon(
                      Icons.logout_outlined,
                      color: Colors.red,
                    ),
                    action: () => Auth().logout()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
