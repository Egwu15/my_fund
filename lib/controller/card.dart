import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:my_fund/controller/profileStorage.dart';
import 'package:my_fund/models/cardModel.dart';
import 'package:my_fund/views/homePage.dart';
import 'package:get/get_rx/get_rx.dart';

class AtmCardController extends GetxController {
  List x = [].obs;
  @override
  void onInit() {
    super.onInit();
    fetchCards().then((val) => bindUserDetails(val));
  }

  bindUserDetails(val) {
    x = jsonDecode(val).toList;
    print(x);
  }

  addCard(
      {required String card,
      required String valid,
      required String cvv}) async {
    String baseUrl = dotenv.env['BASE_URL'] ?? "domain";

    var url = Uri.parse("$baseUrl/insertCard");
    String token = await HiveStorage().getToken();

    try {
      var response = await http.post(url, headers: {
        "Accept": "application/json",
        'Authorization': 'Bearer $token',
      }, body: {
        "card": card,
        "valid": valid,
        "cvv": cvv,
      });
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 201) {
        Get.to(() => HomePage());
        Get.rawSnackbar(message: "Card Details Saved");
        print(response.body);
      } else {
        Get.rawSnackbar(message: "An unknown error occured!");
      }
      //unauthorized

    } catch (e) {
      print(e);
    }
  }

   Future<List>fetchCards() async {
    String baseUrl = dotenv.env['BASE_URL'] ?? "domain";
    var url = Uri.parse("$baseUrl/card");
    String token = await HiveStorage().getToken();
    try {
      var response = await http.get(url, headers: {
        "Accept": "application/json",
        'Authorization': 'Bearer $token',
      });
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        Get.rawSnackbar(message: "An unknown error occured!");
      }
      //unauthorized
      throw Exception('Failed to load Cards');
    } catch (e) {
      print(e);
      throw Exception('Failed to load Cards');
    }
  }
}
