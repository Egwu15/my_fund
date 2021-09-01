import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_fund/controller/auth.dart';
import 'package:my_fund/controller/localAuth.dart';
import 'package:my_fund/controller/storage.dart';
import 'package:my_fund/views/auth/forgotPassword.dart';
import 'package:my_fund/views/auth/signUp.dart';
import 'package:my_fund/views/uiComponents/customButton.dart';
import 'package:my_fund/views/uiComponents/customTextField.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _isLoading = false;
  bool canAuth = false;
  var token;
  LocalAuth localAuth = LocalAuth();
  @override
  void initState() {
    checkToken();
    super.initState();
  }

  checkToken() async {
    token = await HiveStorage().getToken();
    canAuth = await localAuth.checkAuth();
    setState(() {});
    print(token);
    print(canAuth);
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                    "WELCOME",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "The ultimate purpose of\nsaving is to acquire assets for passive income.",
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
                          controller: passwordController,
                          label: "Password",
                          obscureText: true,
                          keybord: TextInputType.visiblePassword),
                      SizedBox(height: 15.0),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: () => Get.to(() => ForgotPassword()),
                          child: Text(
                            "Forgot Password?",
                            style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: Colors.blue),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      if (token != null && canAuth == true)
                        Center(
                          child: IconButton(
                              icon: Icon(
                                Icons.fingerprint_outlined,
                                size: 50,
                              ),
                              onPressed: () {
                                localAuth.authenticate();
                              }),
                        ),
                      SizedBox(height: 20.0),
                      _isLoading
                          ? CircularProgressIndicator.adaptive()
                          : custormButton(
                              text: "LOGIN",
                              action: () {
                                setState(() {
                                  _isLoading = true;
                                });
                                Auth()
                                    .login(
                                  email: emailController.text,
                                  password: passwordController.text,
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
