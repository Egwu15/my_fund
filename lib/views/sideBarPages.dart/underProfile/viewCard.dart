import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_fund/views/uiComponents/customButton.dart';
import 'package:my_fund/views/uiComponents/customTextField.dart';

class ViewCard extends StatefulWidget {
  const ViewCard({Key? key}) : super(key: key);

  @override
  _ViewCardState createState() => _ViewCardState();
}



class _ViewCardState extends State<ViewCard> {
  TextEditingController _cardNumbers = TextEditingController();
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
                  "View Card",
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
                      child: outlinedTransparentField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            CustomInputSlashFormatter(),
                            LengthLimitingTextInputFormatter(5),
                          ],
                          text: "CARD NUMBER",
                          controller: _cardNumbers,
                          hint: "MM / YY"),
                    ),
                    SizedBox(
                      width: Get.width * 0.35,
                      child: outlinedTransparentField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(3),
                          ],
                          text: "CARD NUMBER",
                          controller: _cardNumbers,
                          hint: "123"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Get.back(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: Text(
                          "Cancel",
                          style: GoogleFonts.mulish(
                              fontWeight: FontWeight.w800, fontSize: 14.0),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Get.back(),
                      style: TextButton.styleFrom(backgroundColor: Colors.red),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Delete Card",
                          style: GoogleFonts.mulish(
                              fontWeight: FontWeight.w800,
                              fontSize: 14.0,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 80.0,
                ),
                custormButton(
                  text: "BACk",
                  action: () => Get.back(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
