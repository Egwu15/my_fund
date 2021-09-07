import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_fund/views/sideBarPages.dart/underProfile/loanForm.dart';
import 'package:my_fund/views/uiComponents/customButton.dart';

class Loan extends StatefulWidget {
  // const Loan({Key? key}) : super(key: key);
  @override
  _LoanState createState() => _LoanState();
}

class _LoanState extends State<Loan> {
  bool _checkBoxValue = false;
  final TextStyle bodyStyle = GoogleFonts.nunitoSans(
    fontSize: 15.0,
    fontWeight: FontWeight.w600,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: false,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.deepPurple),
        title: Text(
          "Loan",
          style:
              Theme.of(context).textTheme.headline1!.copyWith(fontSize: 20.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Only a member of MyFund who has made savings contribution for at least 6 months consistently can request for a loan. \nThe maximum amount of loan a member can take is twice the amount contributed by the member.\nThe interest rate/service charge for the loan is 1% per month.",
                style: bodyStyle,
              ),
              SizedBox(
                height: 9.0,
              ),
              Text(
                "A member requesting for loan must have at least 1 Guarantor who has more than the loan amount in his/her savings and Investment account. The Guarantor’s asset with MyFund will serve as collateral for the loan.\nA member who has no Investment account needs to have 2 Guarantors to access loans.",
                style: bodyStyle,
              ),
              SizedBox(
                height: 9.0,
              ),
              Text(
                "A member who has more than the amount requested as loan in his/her share capital can use their Investment account and another person with sufficient Investment account or savings as guarantor.\nLoan repayment can be made monthly at an equal amount, quarterly or as a lump sum at maturity. The maximum tenor for all loans is 12 months. Read more",
                style: bodyStyle,
              ),
              Row(children: [
                Checkbox(
                  onChanged: (val) {
                    if (_checkBoxValue) {
                      setState(() {
                        _checkBoxValue = false;
                      });
                    } else {
                      setState(() {
                        _checkBoxValue = true;
                      });
                    }
                  },
                  value: _checkBoxValue,
                ),
                Text(
                  "I Agree with Terms and Condition",
                  style: bodyStyle,
                ),
              ]),
              SizedBox(height: 20.0),
              custormButton(
                  text: "CONTINUE",
                  action: () {
                    if (_checkBoxValue) {
                      Get.to(() => LoanForm());
                    } else {
                      Get.rawSnackbar(
                          message:
                              "Agree to the terms and conditions before proceeding");
                    }
                  }),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
