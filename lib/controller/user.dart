import 'dart:convert';

import 'package:get/get.dart';
import 'package:my_fund/controller/profileStorage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_fund/models/userModel.dart';

class UserData extends GetxController {
  var count = 0.obs;
  increment() => count++;
  HiveStorage hiveStorage = HiveStorage();
  var userEmail = "...".obs;
  var walletBalance = "...".obs;
  var userFullName = "John doe".obs;
  var bank = "Your bank".obs;
  var account = "xxxx xxxx xxxx xxxx".obs;
  var picture = "https://myfund.tbmholdingltd.com/images/dummy.jpeg".obs;
  @override
  void onInit() {
    super.onInit();
    fetchUser().then((_) => bindUserDetails());
  }

  bindUserDetails() async {
    //email
    var em = await hiveStorage.getEmail();
    userEmail.value = em.toString();

    //wallet
    var bal = await hiveStorage.getwalletBallance();
    walletBalance.value = bal.toString();

    //fullname
    var name = await hiveStorage.getFullName();
    userFullName.value = name ?? '';

    var yourBank = await hiveStorage.getBank();
    bank.value = yourBank ?? "Your bank";

    //account
    var acc = await hiveStorage.getAccount();
    account.value = acc ?? 'xxxx xxxx xxxx xxxx';

    String pic = await hiveStorage.getProfilePicture();
    picture.value = pic ;
    print("PP: ${picture.value}");
  }

//  var email = User.fromJson( HiveStorage().getUser()).data.email.obs;

  fetchUser() async {
    String baseUrl = dotenv.env['BASE_URL'] ?? "domain";
    var url = Uri.parse("$baseUrl/user");
    String token = await hiveStorage.getToken();
    try {
      var response = await http.get(url, headers: {
        "Accept": "application/json",
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 201) {
        // Get.off(() => HomePage());
        await fetchWalletBalance();
        print('Response body: ${jsonDecode(response.body)}');

        hiveStorage.saveEmail(jsonDecode(response.body)['data']['email']);
        hiveStorage.saveFullName(jsonDecode(response.body)['data']['fullName']);
        hiveStorage.saveBank(jsonDecode(response.body)['data']['bank']);
        hiveStorage.saveAccount(jsonDecode(response.body)['data']['account']);
        hiveStorage
            .saveProfilePicture(jsonDecode(response.body)['data']['picture']);

        print("picture: ${jsonDecode(response.body)['data']['picture']}");
        bindUserDetails();
        return User.fromJson(jsonDecode(response.body));
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

  fetchWalletBalance() async {
    String baseUrl = dotenv.env['BASE_URL'] ?? "domain";
    var url = Uri.parse("$baseUrl/wallet");
    String token = await hiveStorage.getToken();
    try {
      var response = await http.get(url, headers: {
        "Accept": "application/json",
        'Authorization': 'Bearer $token',
      });
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        // Get.off(() => HomePage());
        print('Response body: ${jsonDecode(response.body)}');

        hiveStorage.savewalletBallance(jsonDecode(response.body)[0]['balance']);
        print(jsonDecode(response.body)[0]['balance']);

        bindUserDetails();
      } else {
        Get.rawSnackbar(message: "An unknown error occured!");
      }
      //unauthorized

    } catch (e) {
      print(e);
    }
  }
}
