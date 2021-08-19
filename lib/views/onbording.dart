import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:get/route_manager.dart';
import 'package:my_fund/views/auth/signIn.dart';
import 'package:my_fund/views/auth/signUp.dart';
import 'package:my_fund/views/uiComponents/CustormPagesViewModel.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({Key? key}) : super(key: key);

  @override
  _OnbordingScreenState createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  bool _isLastPage = false;
  final ScrollController scrollController = ScrollController();
  final List<PageViewModel> listPagesViewModel = [
    custormPageViewModel(
        title: "Earn up to 30% ROI on you\nfunds.",
        image: "assets/images/saveMn.png"),
    custormPageViewModel(
        title:
            "Develop high income skills at the Wealth Leadership Academy (WLA).",
        image: "assets/images/rise.png"),
    custormPageViewModel(
        title:
            "Track your financial progress on the 9 steps to Financial Freedom.",
        image: "assets/images/pinkSit.png"),
    custormPageViewModel(
        title: "Manage your acquired assets for passive income.",
        image: "assets/images/txtWoman.png")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: Get.height * 0.20),
        child: IntroductionScreen(
          scrollController: scrollController,
          pages: listPagesViewModel,
          showNextButton: false,
          showDoneButton: false,
          // done: Text("Done",
          //     style: GoogleFonts.dmSans(fontWeight: FontWeight.w600)),
          // onDone: () {
          //   // When done button is press
          // },
          globalFooter: _isLastPage
              ? Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 120,
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.deepPurple),
                              elevation: MaterialStateProperty.all(0)),
                          onPressed: ()=>Get.offAll(()=>SignIn()),
                          child: Text("Login",
                              style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                      SizedBox(
                        width: 120,
                        height: 50,
                        child: OutlinedButton(
                          style: ButtonStyle(
                              side: MaterialStateProperty.all(
                                  BorderSide(color: Colors.blue, width: 2.0)),
                              elevation: MaterialStateProperty.all(0)),
                          onPressed: ()=>Get.offAll(()=>SignUp()),
                          child: Text("Register",
                              style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.w600)),
                        ),
                      )
                    ],
                  ),
                )
              : Container(),
          onChange: (val) {
            val == 3
                ? setState(() {
                    _isLastPage = true;
                  })
                : setState(() {
                    _isLastPage = false;
                  });
          },
          nextColor: Colors.blue,
          next: Text('Next'),
        ),
      ),
    ));
  }
}
