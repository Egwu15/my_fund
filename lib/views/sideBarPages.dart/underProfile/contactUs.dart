import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_fund/controller/contactController.dart';
import 'package:my_fund/views/uiComponents/customButton.dart';
import 'package:my_fund/views/uiComponents/customTextField.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  bool _isLoading = false;
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: false,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Contact Us",
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(fontSize: 20.0, color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    "assets/images/computerWoman.png",
                    height: 180.0,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "We are here to help you out",
                    style: GoogleFonts.poppins(
                        fontSize: 17.0, fontWeight: FontWeight.w400),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Your message",
                    style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 9,
                ),
                TextFormField(
                  controller: _controller,
                  minLines: 7,
                  maxLines: 9,
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                _isLoading
                    ? CircularProgressIndicator.adaptive()
                    : custormButton(
                        text: "Send",
                        action: () {
                          setState(() {
                            _isLoading = true;
                          });
                          sendContactMessage(_controller.text).then((_) {
                            setState(() {
                              _isLoading = false;
                            });
                          });
                        })
              ],
            ),
          ),
        ));
  }
}
