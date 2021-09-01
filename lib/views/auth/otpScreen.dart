import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_fund/controller/auth.dart';
import 'package:my_fund/controller/storage.dart';
import 'package:my_fund/views/uiComponents/customButton.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController _otpController = TextEditingController();
  CountdownController _countDownController = CountdownController();
  bool _Isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "verification",
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  height: 160,
                  child: Image.asset(
                    'assets/images/checkLady.png',
                  )),
              SizedBox(height: 30.0),
              Text(
                'Enter OTP Received',
                style: GoogleFonts.dmSans(
                    fontSize: 18.0, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 30.0),
              Text(
                "Check your email and\nenter the OTP received",
                textAlign: TextAlign.center,
                style: GoogleFonts.dmSans(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
              SizedBox(
                width: Get.width * 0.75,
                child: PinCodeTextField(
                  onChanged: (val) {
                    if (val.length == 4) {
                      setState(() {
                        _Isloading = true;
                      });
                      Auth().otp(otp: _otpController.text).then((_) {
                        setState(() {
                          _Isloading = false;
                        });
                      });
                    }
                  },
                  controller: _otpController,
                  length: 4,
                  appContext: context,
                  backgroundColor: Colors.white,
                  pinTheme: PinTheme(
                      selectedColor: Colors.blue,
                      activeColor: Colors.blue,
                      fieldOuterPadding: EdgeInsets.zero,
                      shape: PinCodeFieldShape.underline,
                      fieldWidth: 25.0,
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      activeFillColor: Colors.blueAccent,
                      inactiveColor: Colors.lightBlueAccent),
                ),
              ),
              SizedBox(
                height: 18.0,
              ),
              // if (_IsCounting)
              //   Row(
              //     children: [
              //       Text(
              //         "Resend",
              //         style: GoogleFonts.dmSans(
              //             fontSize: 18,
              //             fontWeight: FontWeight.w700,
              //             color: Colors.red[800]),
              //       ),
              //       Countdown(
              //         seconds: 90,
              //         controller: _countDownController,
              //         build: (BuildContext context, double time) => Text(
              //             "${Duration(seconds: time.floor()).inMinutes} : ${time.floor() % 60}"),
              //         interval: Duration(milliseconds: 100),
              //         onFinished: () {
              //           print('Timer is done!');
              //         },
              //       ),
              //     ],
              //   ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: Get.width * 0.90,
                child: custormButton(
                    text: 'Continue',
                    action: ()async {
                      Auth().otp(otp: _otpController.text);
                     print(await HiveStorage().getToken());
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
