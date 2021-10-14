import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_fund/controller/profileStorage.dart';
import 'package:my_fund/controller/user.dart';
import 'package:my_fund/views/uiComponents/customButton.dart';
import 'package:my_fund/views/uiComponents/customTextField.dart';
import 'package:my_fund/views/uiComponents/profilePicUploadDialog.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({Key? key}) : super(key: key);

  @override
  _AccountSettingsState createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  HiveStorage hiveStorage = HiveStorage();
  @override
  void initState() {
    setFieldValues().then((_) {
      Future.delayed(Duration(seconds: 1), () {
        setState(() {});
      });
    });
    super.initState();
  }

  setFieldValues() async {
    _fullNameController.text = await HiveStorage().getFullName() ?? '';
    _phoneNumberController.text = await HiveStorage().getPhoneNumber();
  }

  @override
  Widget build(BuildContext context) {
    UserData userData = Get.find();
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
          child: Obx(
            () => Column(
              children: [
                Row(children: [
                  GestureDetector(
                    onTap: () => uploadProfileImage(),
                    child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 35.0,
                        child: ClipOval(
                            child: Obx(() => Image.network(
                                  userData.picture.string,
                                  width: 100,
                                  fit: BoxFit.cover,
                                )))),
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
                    enabled: false,
                    keybord: TextInputType.name),
                SizedBox(
                  height: 20.0,
                ),
                custormTextFieldOutlined(
                    enabled: false,
                    label: "Email Address",
                    initialValue: userData.userEmail.string,
                    keybord: TextInputType.emailAddress),
                SizedBox(
                  height: 20.0,
                ),
                // custormTextFieldOutlined(
                //   controller: _fullNameController,
                //   label: "Username",
                // ),
                SizedBox(
                  height: 20.0,
                ),
                custormTextFieldOutlined(
                    controller: _phoneNumberController,
                    label: "PhoneNumber",
                    // initialValue: userData.,
                    keybord: TextInputType.phone),
                SizedBox(
                  height: 30.0,
                ),
                custormButton(text: "Update profile", action: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
