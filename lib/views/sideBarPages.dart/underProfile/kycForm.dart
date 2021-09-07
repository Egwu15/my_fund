import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_fund/controller/kyc.dart';
import 'package:my_fund/views/uiComponents/customButton.dart';
import 'package:my_fund/views/uiComponents/customTextField.dart';
import 'package:my_fund/views/uiComponents/custormDropDownButton.dart';
import 'package:my_fund/views/uiComponents/uploadDialog.dart';

class KycForm extends StatefulWidget {
  const KycForm({Key? key}) : super(key: key);

  @override
  _KycFormState createState() => _KycFormState();
}

class _KycFormState extends State<KycForm> {
  String _chosenGender = "Male";
  String _chosenEmploymentStatus = "Employed";
  String _chosenRelationsipStatus = "single";
  String _chosenNextOfKinRelationship = "Sister";
  TextEditingController _incomePerYear = TextEditingController();
  TextEditingController _fullAddress = TextEditingController();
  TextEditingController _motherMaidenName = TextEditingController();
  TextEditingController _nextOfKin = TextEditingController();
  TextEditingController _nextOfKinPhone = TextEditingController();
  TextEditingController _identificationNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton:
            FloatingActionButton(onPressed: () => Kyc().viewKyc()),
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
            child: Column(children: [
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
                items: <String>["single", "married"],
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
              CustormDropDown(
                label: "Next of Kin Relationship",
                chosenValue: _chosenNextOfKinRelationship,
                items: <String>[
                  "Father",
                  "Mother",
                  "Sister",
                  "Brother",
                  "Friend",
                  "Cousin",
                  "Nephew",
                  "Uncle",
                  "Aunt",
                ],
                hint: "hint text",
                onChanged: (value) {
                  setState(() {
                    _chosenNextOfKinRelationship = value.toString();
                    print(_chosenNextOfKinRelationship);
                  });
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              custormTextField(
                  controller: _nextOfKinPhone,
                  label: "Next of Kin Phone",
                  keybord: TextInputType.phone),
              SizedBox(
                height: 15.0,
              ),
              custormTextField(
                  controller: _identificationNumber,
                  label: "Identification Number",
                  keybord: TextInputType.phone),
              SizedBox(
                height: 15.0,
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Upload ID Card",
                        style: GoogleFonts.dmSans(
                            fontSize: 16.0, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => uploadImage(),
                    child: SizedBox(
                      height: 50.0,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey[300]),
                        padding: EdgeInsets.all(12.0),
                        child: Row(
                          children: [],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              custormButton(
                  text: "SAVE",
                  action: () => kyc.uploadDoc(
                        path: imageUploadPath,
                        gender: _chosenGender,
                        status: _chosenEmploymentStatus,
                        income: _incomePerYear.text,
                        name: "peter",
                        address: _fullAddress.text,
                        nok: _nextOfKin.text,
                        maidenName: _motherMaidenName.text,
                        nokr: _nextOfKinPhone.text,
                        nokp: _chosenNextOfKinRelationship,
                        idNumber: _identificationNumber.text,
                        employeeStatus: _chosenEmploymentStatus,
                      ))
            ]),
          ),
        ));
  }
}
