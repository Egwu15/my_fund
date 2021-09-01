import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_fund/views/uiComponents/customButton.dart';
import 'package:my_fund/views/uiComponents/customTextField.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({Key? key}) : super(key: key);

  @override
  _AccountSettingsState createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  TextEditingController _fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: false,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.deepPurple),
        title: Text(
          "Account Settings",
          style:
              Theme.of(context).textTheme.headline1!.copyWith(fontSize: 20.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(children: [
                CircleAvatar(
                  radius: 35.0,
                  child: Image.asset('assets/images/logo.png'),
                  backgroundColor: Colors.grey,
                ),
                SizedBox(
                  width: 17.0,
                ),
                Text(
                  "Tap to change.",
                  style: GoogleFonts.nunitoSans(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                  ),
                ),
              ]),
              SizedBox(
                height: 20.0,
              ),
              custormTextFieldOutlined(
                  controller: _fullNameController,
                  label: "Full Name",
                  keybord: TextInputType.name),
              SizedBox(
                height: 20.0,
              ),
              custormTextFieldOutlined(
                  controller: _fullNameController,
                  label: "Email Address",
                  keybord: TextInputType.emailAddress),
              SizedBox(
                height: 20.0,
              ),
              custormTextFieldOutlined(
                controller: _fullNameController,
                label: "Username",
              ),
              SizedBox(
                height: 20.0,
              ),
              custormTextFieldOutlined(
                  controller: _fullNameController,
                  label: "PhoneNumber",
                  keybord: TextInputType.phone),
        
                   SizedBox(
                height: 30.0,
              ),
        
              custormButton(text: "Update profile", action:(){})
            ],
          ),
        ),
      ),
    );
  }
}
