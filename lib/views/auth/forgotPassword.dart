import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_fund/controller/auth.dart';
import 'package:my_fund/views/auth/signUp.dart';
import 'package:my_fund/views/uiComponents/customButton.dart';
import 'package:my_fund/views/uiComponents/customTextField.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  bool _isLoading = false;
  bool _optCompleted = false;
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
                    "Forgot Password",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "An OTP will be sent to your email address.",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Form(
                  child: Column(
                    children: [
                      custormTextField(
                          controller: emailController,
                          label: "Email Address",
                          keybord: TextInputType.emailAddress),
                     
                      SizedBox(height: 20.0),
                      _isLoading
                          ? CircularProgressIndicator.adaptive()
                          : custormButton(
                              text: "SEND OTP",
                              action: () {
                                setState(() {
                                  _isLoading = true;
                                });
                                Auth()
                                    .forgotPassword(
                                  email: emailController.text,
                                )
                                    .then((_) {
                                  setState(() {
                                    _isLoading = false;
                                  });
                                });
                              }),
                      SizedBox(height: 20.0),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'New user? ',
                            ),
                            TextSpan(
                              text: 'SignUp',
                              style: GoogleFonts.dmSans(color: Colors.blue),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.to(
                                      () => SignUp(),
                                    ),
                            ),
                          ],
                        ),
                      ),
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
