import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_fund/controller/card.dart';
import 'package:my_fund/models/cardModel.dart';
import 'package:my_fund/views/sideBarPages.dart/underProfile/addNewCard.dart';
import 'package:my_fund/views/uiComponents/atmCard.dart';
import 'package:my_fund/views/uiComponents/colors.dart';
import 'package:my_fund/views/uiComponents/customButton.dart';

class CardSettings extends StatefulWidget {
  const CardSettings({Key? key}) : super(key: key);

  @override
  _CardSettingsState createState() => _CardSettingsState();
}

class _CardSettingsState extends State<CardSettings> {
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
        child: SafeArea(
            child: Column(
          children: [
            // AtmCard(),
            SizedBox(
              height: 12.0,
            ),
            Container(
              height: Get.height * 0.75,
              child: FutureBuilder(
                  future: AtmCardController().fetchCards(),
                  builder: (BuildContext ctx, AsyncSnapshot<List> snapshot) =>
                      snapshot.hasData
                          ? ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (BuildContext context, index) =>
                                  Card(
                                margin: const EdgeInsets.all(10),
                                child: AtmCard(
                                  card: snapshot.data![index]['card'],
                                  valid: snapshot.data![index]['valid'],
                                ),
                                
                              ),
                            )
                          : Center(
                              child: CircularProgressIndicator(),
                            )),
            ),
            SizedBox(
                height: 40.0,
                width: Get.width * 0.80,
                child: custormButton(
                    text: "ADD A NEW CARD",
                    action: () => Get.to(() => AddNewCard())))
          ],
        )),
      ),
    );
  }
}
