import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_fund/controller/auth.dart';
import 'package:my_fund/views/auth/signIn.dart';
import 'package:my_fund/views/uiComponents/customButton.dart';
import 'package:my_fund/views/uiComponents/customTextField.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isloding = false;
   TextEditingController emailController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController couponController = TextEditingController();
    
  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Create Account",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Excited to have you, we look forward to putting a big smile on your face.",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Form(
                    child: Column(
                  children: [
                    custormTextFieldOutlined(
                        controller: emailController,
                        label: "Email Address",
                        keybord: TextInputType.emailAddress),
                    SizedBox(height: 15.0),
                    custormTextFieldOutlined(
                        controller: phoneNumberController,
                        label: "Phone Number",
                        keybord: TextInputType.phone),
                    SizedBox(height: 15.0),
                    custormTextFieldOutlined(
                        controller: passwordController,
                        label: "Password",
                        obscureText: true,
                        keybord: TextInputType.visiblePassword),
                    SizedBox(height: 15.0),
                    custormTextFieldOutlined(
                        controller: couponController,
                        label: "Referrer Phone or Promo Code",
                        keybord: TextInputType.phone),
                    SizedBox(height: 30.0),
                    _isloding
                        ? CircularProgressIndicator.adaptive()
                        : custormButton(
                            text: "SIGN UP",
                            action: () {
                              setState(() {
                                _isloding = true;
                              });
                              Auth().registerUser(
                                      email: emailController.text,
                                      phone: phoneNumberController.text,
                                      password: passwordController.text)
                                  .then((_) {
                                setState(() {
                                  _isloding = false;
                                });
                              });
                            }),
                    SizedBox(height: 20.0),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Already have Account? ',
                          ),
                          TextSpan(
                              text: 'Login',
                              style: GoogleFonts.dmSans(color: Colors.blue),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.to(() => SignIn()))
                        ],
                      ),
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
