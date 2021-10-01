import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get/get_rx/get_rx.dart';
import 'package:get/instance_manager.dart';
import 'package:my_fund/controller/accountStorage.dart';
import 'package:my_fund/controller/profileStorage.dart';

class AccountController extends GetxController {
  AccountHiveStorage accountHiveStorage = AccountHiveStorage();
  String baseUrl = dotenv.env['BASE_URL'] ?? "domain";
  var totalInvestment = "...".obs;
  var fractionalInvestments = "...".obs;
  @override
  void onInit() {
    accountCalls().then((_) => accountBinding());
    super.onInit();
  }

  accountBinding() async {
    totalInvestment.value =
        await accountHiveStorage.getTotalInvestments() ?? "error loading";
    fractionalInvestments.value =
        await accountHiveStorage.getFractionalOwner() ?? "error loading";
    print("t: $totalInvestment , fra: $fractionalInvestments");
  }

  accountCalls() async{
   await getFractionalOwner();
   await getTotalInvestment();
  }

  getTotalInvestment() async {
    var url = Uri.parse("$baseUrl/sumOfInvestment");
    String token = await HiveStorage().getToken();
    try {
      var response = await http.get(url, headers: {
        "Accept": "application/json",
        'Authorization': 'Bearer $token',
      });
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        accountHiveStorage
            .saveTotalInvestments(jsonDecode(response.body)['data']);
        print("totaliv: ${jsonDecode(response.body)['data']}");
        print(response.body);
      } else {
        Get.rawSnackbar(message: "An unknown error occured!");
      }
      //unauthorized

    } catch (e) {
      print(e);
    }
  }

  getFractionalOwner() async {
    var url = Uri.parse("$baseUrl/getFractionalOwner");
    String token = await HiveStorage().getToken();
    try {
      var response = await http.get(url, headers: {
        "Accept": "application/json",
        'Authorization': 'Bearer $token',
      });
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        accountHiveStorage
            .saveFractionalOwner(jsonDecode(response.body)["data"]);
        print("${jsonDecode(response.body)["data"]}");
        
      } else {
        Get.rawSnackbar(message: "An unknown error occured!");
      }
      //unauthorized

    } catch (e) {
      print(e);
    }
  }
}
