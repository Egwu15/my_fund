import 'package:flutter/material.dart';
import 'package:my_fund/controller/loanController.dart';
import 'package:my_fund/views/uiComponents/customButton.dart';
import 'package:my_fund/views/uiComponents/customTextField.dart';
import 'package:my_fund/views/uiComponents/custormDropDownButton.dart';
import 'package:my_fund/views/uiComponents/uploadButton.dart';
import 'package:my_fund/views/uiComponents/uploadDialog.dart';

class LoanForm extends StatefulWidget {
  const LoanForm({Key? key}) : super(key: key);

  @override
  _LoanFormState createState() => _LoanFormState();
}

class _LoanFormState extends State<LoanForm> {
  TextEditingController _gurantorName = TextEditingController();
  TextEditingController _gurantorPhoneNumber = TextEditingController();
  TextEditingController _gurantorName2 = TextEditingController();
  TextEditingController _gurantorPhoneNumber2 = TextEditingController();
  TextEditingController _gurantorIdNumber = TextEditingController();
  TextEditingController _ammount = TextEditingController();
  TextEditingController _reason = TextEditingController();

  TextEditingController _repayAmmount = TextEditingController();
  TextEditingController _intrestRate = TextEditingController();
  String _duration = "3 months";

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
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              custormTextField(
                  controller: _gurantorName, label: "Guarator Name"),
              SizedBox(
                height: 15.0,
              ),
              custormTextField(
                  controller: _gurantorPhoneNumber,
                  label: "Guarator Phone number",
                  keybord: TextInputType.number),
              SizedBox(
                height: 15.0,
              ),
              custormTextField(
                controller: _gurantorName2,
                label: "Guarator(2)  Name",
              ),
              SizedBox(
                height: 15.0,
              ),
              custormTextField(
                  controller: _gurantorPhoneNumber2,
                  label: "Guarator Phone number",
                  keybord: TextInputType.number),
              SizedBox(
                height: 15.0,
              ),
              custormTextField(
                  controller: _gurantorIdNumber,
                  label: "Guarator Identification Number",
                  keybord: TextInputType.number),
              SizedBox(
                height: 15.0,
              ),
              UploadButton(action: () => uploadImage()),
              SizedBox(
                height: 15.0,
              ),
              custormTextField(
                  controller: _ammount,
                  label: "Amount to borrow",
                  keybord: TextInputType.number),
              SizedBox(
                height: 15.0,
              ),
              custormTextField(controller: _reason, label: "Reason for loan"),
              SizedBox(
                height: 15.0,
              ),
              CustormDropDown(
                  label: "Loan Duration",
                  chosenValue: _duration,
                  items: <String>["3 months", "6 months", "9 months", "1 year"],
                  hint: "Repay Duration",
                  onChanged: (val) {
                    setState(() {
                      _duration = val.toString();
                    });
                  }),
              SizedBox(
                height: 15.0,
              ),
              custormTextField(
                  controller: _repayAmmount,
                  label: "Repay Amount Monthly",
                  keybord: TextInputType.number),
              SizedBox(
                height: 15.0,
              ),
              custormTextField(
                  controller: _intrestRate,
                  label: "Interest Percent",
                  keybord: TextInputType.number),
              SizedBox(
                height: 35.0,
              ),
              custormButton(
                  text: "SUBMIT",
                  action: () => LoanController().uploadDoc(
                      path: imageUploadPath,
                      gt1Name: _gurantorName.text,
                      gt1Phone: _gurantorPhoneNumber.text,
                      gt2Name: _gurantorName2.text,
                      gt2Phone: _gurantorPhoneNumber2.text,
                      idNumber: _gurantorIdNumber.text,
                      ammount: _ammount.text,
                      reason: _reason.text,
                      duration: _duration,
                      montlyrepay: _repayAmmount.text,
                      intrest: _intrestRate.text)),
              SizedBox(
                height: 15.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
