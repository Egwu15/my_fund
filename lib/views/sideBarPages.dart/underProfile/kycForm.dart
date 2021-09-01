import 'package:flutter/material.dart';
import 'package:my_fund/views/uiComponents/customTextField.dart';
import 'package:my_fund/views/uiComponents/custormDropDownButton.dart';

class KycForm extends StatefulWidget {
  const KycForm({Key? key}) : super(key: key);

  @override
  _KycFormState createState() => _KycFormState();
}

class _KycFormState extends State<KycForm> {
  String _chosenGender = "Male";
  String _chosenEmploymentStatus = "Employed";
  String _chosenRelationsipStatus = "Single";
  TextEditingController _incomePerYear = TextEditingController();
  TextEditingController _fullAddress = TextEditingController();
  TextEditingController _motherMaidenName = TextEditingController();
  TextEditingController _nextOfKin = TextEditingController();
  TextEditingController _nextOfKinPhone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: false,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.deepPurple),
          title: Text(
            "KYC PROFILE",
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
                    " KYC (Know Your Customer) guidelines by CBN are meant to prevent your account from being used, intentionally or unintentionally, by criminal elements for money laundering activities."),
                SizedBox(
                  height: 15.0,
                ),
                CustormDropDown(
                  label: "Gender",
                  chosenValue: _chosenGender,
                  items: <String>["Male", "Female"],
                  hint: "hint text",
                  onChanged: (value) {
                    setState(() {
                      _chosenGender = value.toString();
                      print(_chosenGender);
                    });
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                CustormDropDown(
                  label: "Relationship Status",
                  chosenValue: _chosenRelationsipStatus,
                  items: <String>["Single", "Married"],
                  hint: "hint text",
                  onChanged: (value) {
                    setState(() {
                      _chosenRelationsipStatus = value.toString();
                      print(_chosenRelationsipStatus);
                    });
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                CustormDropDown(
                  label: "Employent Status",
                  chosenValue: _chosenEmploymentStatus,
                  items: <String>["Employed", "Unemployed"],
                  hint: "hint text",
                  onChanged: (value) {
                    setState(() {
                      _chosenEmploymentStatus = value.toString();
                      print(_chosenEmploymentStatus);
                    });
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                custormTextField(
                    controller: _incomePerYear,
                    label: "How much d you get in total per year",
                    keybord: TextInputType.number),
                SizedBox(
                  height: 15.0,
                ),
                custormTextField(
                    controller: _fullAddress,
                    label: "Enter Full address",
                    keybord: TextInputType.streetAddress),
                SizedBox(
                  height: 15.0,
                ),
                custormTextField(
                    controller: _motherMaidenName,
                    label: "Mother's Maiden Name",
                    keybord: TextInputType.name),
                SizedBox(
                  height: 15.0,
                ),
                custormTextField(
                    controller: _nextOfKin,
                    label: "Next of Kin Name",
                    keybord: TextInputType.name),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ));
  }
}
