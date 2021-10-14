import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_fund/controller/accountsController.dart';
import 'package:my_fund/views/uiComponents/colors.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:my_fund/views/uiComponents/customButton.dart';

class SponsorshipInvestment extends StatelessWidget {
  const SponsorshipInvestment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AccountController accountController = Get.find();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.1, 0.2],
                      colors: [Colors.white, Colors.blue[300]!],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                    color: deepPurple),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Image.asset(
                          "assets/images/bulbJar.png",
                        ),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Flexible(
                        child: Text(
                          "Current Savings Goal:  45,000 in 4 Years. And you're 67% close to your goal.",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14.0,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                    color: Colors.blue[700]),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Sponsorship Investment",
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Interest: 13% p.a.",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Quick Invest",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 10.0),
                            ),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.blue[600]),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "AutoInvest Deposit",
                            style: GoogleFonts.poppins(
                                color: Colors.purple,
                                fontWeight: FontWeight.w400,
                                fontSize: 12.0),
                          ),
                          Text(
                            "₦${accountController.totalInvestment.value} monthly",
                            style: GoogleFonts.nunitoSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.account_balance_outlined,
                            color: Colors.purple,
                          ),
                          Text(
                            "WITHDRAW",
                            style: GoogleFonts.inter(
                                color: Colors.purple,
                                fontWeight: FontWeight.w400,
                                fontSize: 12.0),
                          ),
                        ],
                      ),
                    ]),
              ),
              SizedBox(
                height: 20,
              ),
              custormButton(text: "AUTO INVEST", action: () {}),
              SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "AutoInvest is Turn off",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                  ),
                ),
              ),
              CustormOutlinedButton(
                text: "SETTINGS",
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Recent Transaction",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 41,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "All",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0,
                            color: Colors.purple),
                      ),
                      Text(
                        "Credit",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0,
                            color: Colors.green),
                      ),
                      Text(
                        "Debit",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0,
                            color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Container(
                      height: 44.0,
                      width: 44.0,
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "N",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nohan Putra",
                          style: GoogleFonts.nunitoSans(
                              fontWeight: FontWeight.w400, fontSize: 16),
                        ),
                        Text(
                          "09 Mar 2021",
                          style: GoogleFonts.nunitoSans(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "+ 150,000",
                          style: GoogleFonts.nunitoSans(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Colors.green),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Container(
                      height: 44.0,
                      width: 44.0,
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "N",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nohan Putra",
                          style: GoogleFonts.nunitoSans(
                              fontWeight: FontWeight.w400, fontSize: 16),
                        ),
                        Text(
                          "09 Mar 2021",
                          style: GoogleFonts.nunitoSans(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "+ 150,000",
                          style: GoogleFonts.nunitoSans(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Colors.red),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
