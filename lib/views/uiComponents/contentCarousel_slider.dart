import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_fund/controller/accountsController.dart';
import 'package:my_fund/views/bottomNavPages/underMyfundPage/quickInvestment.dart';

import 'colors.dart';

class ContentCarousel extends StatefulWidget {
  ContentCarousel({
    Key? key,
  }) : super(key: key);

  @override
  _ContentCarouselState createState() => _ContentCarouselState();
}

class _ContentCarouselState extends State<ContentCarousel> {
  int _current = 0;

  static final List imgList = [
   1,2,3,4,5
  ];

  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      // Image.network(item, fit: BoxFit.cover, width: 1000.0),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Text(
                            'No. ${"imgList.indexOf(item)"} image',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ))
      .toList();

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final AccountController accountController = Get.put(AccountController());
    return Column(
      children: [
        Obx(()=> CarouselSlider(
            items: [
              CardSliderCard(
                text: "Total Savings",
                amount: accountController.totalInvestment.string,
                quickSave: () {},
              ),
              CardSliderCard(
                text: "Total Investment  ",
                quickSave: ()=>Get.to(()=>QuickInvestment()),
                quickSaveText: "Quick Invest",
              ),
              CardSliderCard(
                text: "Total Fractional Ownership  ",
                quickSave: () {},
              ),
              CardSliderCard(
                text: "Total Wallet   ",
                quickSave: () {},
              ),
              CardSliderCard(
                text: "Total Points  ",
                quickSave: () {},
              ),
            ],
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(),
            Container(),
            Container(),
            Container(),
            Container(),
          ].asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class CardSliderCard extends StatelessWidget {
  const CardSliderCard(
      {Key? key,
      required this.text,
      this.amount = "0",
      required this.quickSave,
     this.quickSaveText = "Quick save"})
      : super(key: key);
  final String text;
  final String amount;
  final String quickSaveText;
  final Function quickSave;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 130,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
          color: deepPurple),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: GoogleFonts.nunitoSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.0,
                  color: Colors.white),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              "₦$amount",
              style: GoogleFonts.nunitoSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.0,
                  color: Colors.white),
            ),
            Expanded(
              child: Center(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Auto Save",
                          style: TextStyle(color: Colors.white, fontSize: 10.0),
                        ),
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.purple),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      TextButton(
                        onPressed: () => quickSave(),
                        child: Text(
                          quickSaveText,
                          style: TextStyle(color: Colors.white, fontSize: 10.0),
                        ),
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.purple),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
