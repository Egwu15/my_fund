import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_fund/controller/storage.dart';
import 'package:my_fund/models/registrationModel.dart';
import 'package:my_fund/views/auth/forgotPassword.dart';
import 'package:my_fund/views/auth/resetPassword.dart';
import 'package:my_fund/views/auth/signIn.dart';
import 'package:my_fund/views/homePage.dart';
import 'package:my_fund/views/onbording.dart';

class Auth {
  String baseUrl = dotenv.env['BASE_URL'] ?? "domain";
  HiveStorage hiveStorage = HiveStorage();
  registerUser(
      {required String email,
      required String phone,
      required String password}) async {
    print("here");

    var url = Uri.parse("$baseUrl/register");
    print(url);

    try {
      var response = await http.post(url,
          body: {'email': email, 'phone': phone, 'password': password},
          headers: {"Accept": "application/json"});

      if (response.statusCode == 200) {
        var token = registerFromJson(response.body).token;
        hiveStorage.saveToken(token);

        Get.offAll(() => HomePage());
      } else if (response.statusCode == 422) {
        Get.rawSnackbar(message: "The email is already taken!");
      } else {
        Get.rawSnackbar(message: "An unknown error occured!");
      }
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    } catch (e) {
      print(e);
    }
  }

  login({required String email, required String password}) async {
    print("here");

    var url = Uri.parse("$baseUrl/login");
    print(url);

    try {
      var response = await http.post(url,
          body: {'email': email, 'password': password},
          headers: {"Accept": "application/json"});

      if (response.statusCode == 200) {
        var token = registerFromJson(response.body).token;
        hiveStorage.saveToken(token);
        Get.offAll(() => HomePage());
      } else if (response.statusCode == 401) {
        Get.rawSnackbar(message: "Wrong email or password");
      } else {
        Get.rawSnackbar(message: "An unknown error occured!");
      }
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    } catch (e) {
      print(e);
    }
  }

  forgotPassword({required String email}) async {
    var url = Uri.parse("$baseUrl/forgot");

    try {
      var response = await http.post(url, body: {
        'email': email,
      }, headers: {
        "Accept": "application/json"
      });

      if (response.statusCode == 201) {
        Get.off(() => ResetPassword());
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

  resetPassword({required String password, required String otp}) async {
    var url = Uri.parse("$baseUrl/reset");

    try {
      var response = await http.post(url,
          body: {'code': otp, 'password': password},
          headers: {"Accept": "application/json"});

      if (response.statusCode == 201) {
        Get.off(() => SignIn());
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

  logout() {
    hiveStorage.clearToken();
    Get.offAll(() => OnbordingScreen());
  }
}
