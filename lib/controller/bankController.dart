import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/route_manager.dart';
import 'package:my_fund/controller/profileStorage.dart';
import 'package:http/http.dart' as http;

class BankController {
  String baseUrl = dotenv.env['BASE_URL'] ?? "domain";

  getBanks() async {
    try {
      String token = await HiveStorage().getToken();
      var url = Uri.parse('$baseUrl/bank');
      var response = await http.get(url, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        var resBody = json.decode(response.body);
        print(resBody);

        var bank = resBody;

        return bank;
      }
      print("online status : ${response.statusCode}");
    } catch (e) {
      print(e);
    }
  }

  sendBankRequest({required String bank, required String account}) async {
    var url = Uri.parse("$baseUrl/bankDetail");

    try {
      String token = await HiveStorage().getToken();
      var response = await http.post(url, body: {
        
        'bank': bank,
        'account': account
      }, headers: {
        "Accept": "application/json",
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 200) {
        Get.rawSnackbar(message: "Bank updated sucessfully");
      } else {
        Get.rawSnackbar(message: "An unknown error occured!");
      }
      //unauthorized
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    } catch (e) {
      print(e);
    }
  }
}
