import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_uploader/flutter_uploader.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_fund/controller/profileStorage.dart';

import 'package:http/http.dart' as http;
import 'package:my_fund/views/homePage.dart';

class LoanController {
  final uploader = FlutterUploader();
  late String _path;
  final picker = ImagePicker();
  String baseUrl = dotenv.env['BASE_URL'] ?? "domain";
  uploadNotification(
      {required String body, required int progress, required String title}) {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 12,
            channelKey: 'basic_channel',
            title: title,
            body: body,
            autoCancel: true,
            progress: progress,
            notificationLayout: NotificationLayout.ProgressBar));
  }

  Future getDocFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    _path = pickedFile!.path;
    print(pickedFile.path + pickedFile.name);

    return _path;
  }

  Future getDocFromGallary() async {
    FlutterUploader().clearUploads();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    print("object");
    _path = pickedFile!.path;
    print(pickedFile.path + pickedFile.name);

    return _path;
  }

  uploadDoc({
    required String path,
    required String gt1Name,
    required String gt1Phone,
    required String gt2Name,
    required String gt2Phone,
    required String idNumber,
    required String ammount,
    required String reason,
    required String duration,
    required String montlyrepay,
    required String intrest,
  }) async {
    var userToken = await HiveStorage().getToken();

    Get.to(()=>HomePage());
    Get.rawSnackbar(message: "uploading ...");

    var formData = FormData.fromMap({
      "gt1_name": gt1Name,
      "gt1_phone": gt1Phone,
      "gt2_name": gt2Name,
      "gt2_phone": gt2Phone,
      "idNumber": idNumber,
      "amount": ammount,
      "reason": reason,
      "duration": duration,
      "monthlyRepay": montlyrepay,
      "interest": intrest,
      'id_card': await MultipartFile.fromFile(path, filename: 'upload.jpg'),
    });

    var dio = Dio();
    Response response = await dio.post('$baseUrl/loan', data: formData,
        onSendProgress: (int sent, int total) {
      int totalPercentage = ((sent / total) * 100).toInt();

      uploadNotification(
          body: "Loan", progress: totalPercentage, title: "uploading document");

      print(totalPercentage);
    },
        options: Options(validateStatus: (status) => true, headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $userToken',
        }));

    print(response.data.toString());
    print(response.statusCode);
    if (response.statusCode == 200) {
      Get.rawSnackbar(message: response.data['data']);
      uploadNotification(
          body: response.data['data'],
          progress: 100,
          title: 'uploading complete');
    } else {
      AwesomeNotifications().createNotification(
          content: NotificationContent(
        id: 12,
        channelKey: 'basic_channel',
        title: 'upload faied',
        body: "Please try again",
        autoCancel: true,
      ));
    }
  }

  viewKyc() async {
    var url = Uri.parse("$baseUrl/getKyc");
    String token = await HiveStorage().getToken();
    try {
      var response = await http.get(url, headers: {
        "Accept": "application/json",
        'Authorization': 'Bearer $token',
      });
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        // Get.off(() => HomePage());
        print(response.body);
      } else {
        Get.rawSnackbar(message: "An unknown error occured!");
      }
      //unauthorized

    } catch (e) {
      print(e);
    }
  }
}
