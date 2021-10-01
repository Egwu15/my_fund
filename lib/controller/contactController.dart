import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:my_fund/controller/profileStorage.dart';

String baseUrl = dotenv.env['BASE_URL'] ?? "domain";

sendContactMessage(message) async {
  try {
    var url = Uri.parse("$baseUrl/contactUs");
    String token = await HiveStorage().getToken();

    var response = await http.post(url, headers: {
      "Accept": "application/json",
      'Authorization': 'Bearer $token',
    }, body: {
      "message": message,
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      Get.back();
      Get.rawSnackbar(message: "Message sent");
    } else {
      Get.rawSnackbar(message: "An unknown error occured!");
    }
  } catch (e) {
    print(e);
  }
}
