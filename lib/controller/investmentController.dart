import 'dart:convert';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_fund/controller/profileStorage.dart';


class InvestmentController {
  

   quickInvestment(
      {
      required String ammout}) async {
    String baseUrl = dotenv.env['BASE_URL'] ?? "domain";

    var url = Uri.parse("$baseUrl/investment");
    String token = await HiveStorage().getToken();

    try {
      var response = await http.post(url, headers: {
        "Accept": "application/json",
        'Authorization': 'Bearer $token',
      }, body: {
        "amount": ammout,
        "method": "pay with Card",
        
      });
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 201) {
        // Get.to(() => );
        // Get.rawSnackbar(message: "Sa");
        print(response.body);
      } else {
        // Get.rawSnackbar(message: "An unknown error occured!");
      }
      //unauthorized

    } catch (e) {
      print(e);
    }
  }
}
