import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_fund/controller/bankController.dart';
import 'package:my_fund/views/uiComponents/customButton.dart';
import 'package:my_fund/views/uiComponents/customTextField.dart';
import 'package:my_fund/views/uiComponents/custormDropDownButton.dart';

class UpdateBank extends StatefulWidget {
  @override
  _UpdateBankState createState() => _UpdateBankState();
}

class _UpdateBankState extends State<UpdateBank> {
  TextEditingController amountTextController = TextEditingController();
  BankController bankController = BankController();
  bool _isLoading = false;
  var selectedBank;
  bool _isBankloading = true;
  List<String> bank = [];
  String accountDetails = '';
  var banks;

  @override
  void initState() {
    super.initState();
    _setBanks();
  }

  _setBanks() async {
    // banks = await
    bankController.getBanks().then((banks) {
      print("banks: $banks['name']");
      print("bankName: ${banks[0]['name']}");
      selectedBank = banks[0]['name'];
      for (var i = 0; i < banks.length; i++) {
        bank.add("${banks[i]['name']}");
        // print('banks: $bank');
      }
      setState(() {});
    });
    print("banks2: $banks");
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

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
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "This is where funds you have saved on Myfund will be sent to when you initiate a withdrawal",
                style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w500, fontSize: 16.0),
              ),
              SizedBox(
                height: 40.0,
              ),
              bank.length < 2
                  ? Text("loading banks...")
                  : CustormDropDown(
                      label: "Name of Bank",
                      chosenValue: selectedBank,
                      items: bank,
                      hint: "Select your bank",
                      onChanged: (value) {
                        setState(() {
                          selectedBank = value;
                        });
                      },
                    ),
              SizedBox(
                height: 15.0,
              ),
              custormTextField(
                  controller: amountTextController,
                  keybord: TextInputType.number,
                  onChanged: (value) {
                    if (value.length == 10) {
                      setState(() {
                        accountDetails = "loading account...";
                      });
                    } else {
                      setState(() {
                        accountDetails = '';
                      });
                    }
                  },
                  label: "Account Number"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(accountDetails)),
              ),
              SizedBox(
                height: 15.0,
              ),
              SizedBox(
                height: 40.0,
              ),
              _isLoading
                  ? CircularProgressIndicator.adaptive()
                  : custormButton(
                      text: "UPDATE BANK",
                      action: () {
                        if (
                            amountTextController.text.length == 10) {
                          setState(() {
                            _isLoading = true;
                          });
                          bankController.sendBankRequest(
                                  bank: selectedBank,
                                  account: amountTextController.text)
                              .then((_) {
                            _isLoading = false;
                          });
                        } else {
                          Get.rawSnackbar(
                              message: "Please fill form currectly");
                        }
                      }),
              SizedBox(height: 15.0),
              CustormOutlinedButton(),
              SizedBox(height: 30.0)
            ],
          ),
        ),
      ),
    );
  }
}
