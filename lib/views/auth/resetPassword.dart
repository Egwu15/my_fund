import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_fund/controller/auth.dart';
import 'package:my_fund/views/uiComponents/colors.dart';
import 'package:my_fund/views/uiComponents/customButton.dart';
import 'package:my_fund/views/uiComponents/customTextField.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Reset Password",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Enter OTP from email.",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Form(
                  child: Column(
                    children: [
                      PinCodeTextField(
                        onChanged: (val) {
                          // if (val.length == 8) {
                          //   setState(() {
                          //     _optCompleted = true;
                          //   });
                          // }
                        },
                        controller: otpController,
                        length: 8,
                        appContext: context,
                        backgroundColor: Colors.white,
                        pinTheme: PinTheme(
                            selectedColor: Colors.purple,
                            activeColor: deepPurple,
                            fieldOuterPadding: EdgeInsets.all(3.0),
                            shape: PinCodeFieldShape.underline,
                            fieldWidth: 25.0,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            activeFillColor: Colors.red),
                      ),
                      SizedBox(height: 20.0),
                      custormTextFieldOutlined(
                          controller: passwordController,
                          label: "New password",
                          obscureText: true,
                          keybord: TextInputType.visiblePassword),
                      SizedBox(height: 20.0),
                      _isLoading
                          ? CircularProgressIndicator.adaptive()
                          : custormButton(
                              text: "RESET PASSWORD",
                              action: () {
                                setState(() {
                                  _isLoading = true;
                                });
                                Auth()
                                    .resetPassword(
                                        password: passwordController.text,
                                        otp: otpController.text)
                                    .then((_) {
                                  setState(() {
                                    _isLoading = false;
                                  });
                                });
                              }),
                      SizedBox(height: 20.0),
                      SizedBox(height: 10.0),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
