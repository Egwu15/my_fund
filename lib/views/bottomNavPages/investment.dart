import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_fund/controller/accountsController.dart';
import 'package:my_fund/views/bottomNavPages/underSavings/fractionalOwnershipInvestment.dart';
import 'package:my_fund/views/bottomNavPages/underSavings/sponsorshipInvestment.dart';
import 'package:my_fund/views/uiComponents/colors.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Investment extends StatelessWidget {
  const Investment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AccountController accountController = Get.find();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Points: 200",
              style: GoogleFonts.nunitoSans(
                  fontSize: 18, fontWeight: FontWeight.w700),
            ),
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
                    "Total Investments",
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
                      "₦${accountController.totalInvestment.value}",
                      style: GoogleFonts.nunitoSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 24.0,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Image.asset(
            "assets/images/bulbPeople.png",
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Build your portfolio and acquire assets in your name for a lifetime of passive income especially with Fractional Ownership Investment.",
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Get.to(() => SponsorshipInvestment()),
                child: Container(
                  alignment: Alignment.centerLeft,
                  height: 180,
                  width: (Get.width - 50) / 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                      color: Colors.lightBlue[200]),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.security_outlined),
                        Text(
                          "Sponsorship Investment ",
                          style: GoogleFonts.nunitoSans(
                            fontWeight: FontWeight.w700,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Obx(
                          () => Text(
                            "₦${accountController.totalInvestment.value}",
                            style: GoogleFonts.nunitoSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 24.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () =>Get.to(()=>FractionalOwnershipInvestment()),
                child: Container(
                  alignment: Alignment.centerLeft,
                  height: 180,
                  width: (Get.width - 50) / 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                      color: Colors.purple[100]),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.psychology_outlined),
                        Text(
                          "Fractional Ownership Investment",
                          style: GoogleFonts.nunitoSans(
                            fontWeight: FontWeight.w700,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Obx(
                          () => Text(
                            "₦${accountController.totalInvestment.value}",
                            style: GoogleFonts.nunitoSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 24.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
