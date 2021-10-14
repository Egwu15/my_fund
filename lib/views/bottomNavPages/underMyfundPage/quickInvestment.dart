import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:my_fund/controller/investmentController.dart';
import 'package:my_fund/views/uiComponents/customButton.dart';
import 'package:my_fund/views/uiComponents/customTextField.dart';

class QuickInvestment extends StatefulWidget {
  const QuickInvestment({Key? key}) : super(key: key);

  @override
  _QuickInvestmentState createState() => _QuickInvestmentState();
}

class _QuickInvestmentState extends State<QuickInvestment> {
  TextEditingController _accountController = TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: false,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.deepPurple),
          title: Text(
            "Quick Investment",
            style:
                Theme.of(context).textTheme.headline1!.copyWith(fontSize: 20.0),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),
                custormTextFieldOutlined(
                    controller: _accountController,
                    keybord: TextInputType.number,
                    label: "Ammount"),
                SizedBox(
                  height: 50,
                ),
                _isLoading
                    ? CircularProgressIndicator.adaptive()
                    : custormButton(
                        text: "Invest",
                        action: () {
                          if (_accountController.text.length < 2) {
                            Get.rawSnackbar(
                                message: "At least #100 is required");
                          } else {
                            setState(() {
                              _isLoading = true;
                              print("true");
                            });
                            InvestmentController()
                                .quickInvestment(
                                    ammout: _accountController.text)
                                .then((_) {
                              setState(() {
                                _isLoading = false;
                              });
                            });
                          }
                        })
              ],
            ),
          ),
        ));
  }
}
