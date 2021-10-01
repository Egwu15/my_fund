import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_fund/controller/auth.dart';
import 'package:my_fund/controller/card.dart';
import 'package:my_fund/views/uiComponents/atmCard.dart';
import 'package:my_fund/views/uiComponents/customButton.dart';
import 'package:my_fund/views/uiComponents/customTextField.dart';

class AddNewCard extends StatefulWidget {
  const AddNewCard({Key? key}) : super(key: key);

  @override
  _AddNewCardState createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
  TextEditingController _cardNumbers = TextEditingController();
  TextEditingController _valid = TextEditingController();
  TextEditingController _cvv = TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: false,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.deepPurple),
        title: Text(
          "Card Settings",
          style:
              Theme.of(context).textTheme.headline1!.copyWith(fontSize: 20.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Add Card",
                  style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w800, fontSize: 22.0),
                ),
                SizedBox(
                  height: 38.0,
                ),
                outlinedTransparentField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CustomInputSpaceFormatter()
                    ],
                    text: "CARD NUMBER",
                    controller: _cardNumbers,
                    hint: "8881  4749  9383  ****"),
                SizedBox(
                  height: 35.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Get.width * 0.35,
                      child: outlinedTransparentField(inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CustomInputSlashFormatter(),
                        LengthLimitingTextInputFormatter(5),
                      ], text: "EXPIRY", controller: _valid, hint: "MM / YY"),
                    ),
                    SizedBox(
                      width: Get.width * 0.35,
                      child: outlinedTransparentField(inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(3),
                      ], text: "CVV", controller: _cvv, hint: "123"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.0,
                ),
                SizedBox(
                  height: 80.0,
                ),
                _isLoading
                    ? Center(
                        child: CircularProgressIndicator.adaptive(),
                      )
                    : custormButton(
                        text: "ADD CARD",
                        action: () {
                          print(_cardNumbers.text.replaceAll(" ", ""));
                          print(_valid.text);
                          print(_cvv.text);
                          setState(() {
                            _isLoading = true;
                          });
                          AtmCardController()
                              .addCard(
                                  card: _cardNumbers.text.replaceAll(" ", ""),
                                  valid: _valid.text,
                                  cvv: _cvv.text)
                              .then((_) {
                            setState(() {
                              _isLoading = false;
                            });
                          });
                        })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
