import 'dart:io';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_uploader/flutter_uploader.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_fund/controller/profileStorage.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;

class Kyc {
  final uploader = FlutterUploader();
  late XFile _image;
  late String _path;
  final picker = ImagePicker();
  String baseUrl = dotenv.env['BASE_URL'] ?? "domain";

  Future getDocFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    _image = XFile(pickedFile!.path);
    _path = pickedFile.path;
    print(pickedFile.path + pickedFile.name);

    return _path;
  }

  Future getDocFromGallary() async {
    FlutterUploader().clearUploads();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    _image = XFile(pickedFile!.path);
    print("object");
    _path = pickedFile.path;
    print(pickedFile.path + pickedFile.name);

    return _path;
  }

  uploadDoc({
    required String path,
    required String gender,
    required String status,
    required String income,
    required String name,
    required String nok,
    required String address,
    required String nokr,
    required String nokp,
    required String idNumber,
    required String maidenName,
    required String employeeStatus,
  }) async {
    var userToken = await HiveStorage().getToken();

    Get.back();
    Get.rawSnackbar(message: "uploading ...");

    var formData = FormData.fromMap({
      'gender': gender,
      'status': status,
      'income': income,
      'name': name,
      'nok_name': nok,
      'nokr': nokr,
      'address': address,
      'nokp': nokp,
      "maidian_name": maidenName,
      'idNumber': idNumber,
      'employeeStatus': employeeStatus,
      'document': await MultipartFile.fromFile(path, filename: 'upload.jpg'),
    });

    var dio = Dio();
    Response response = await dio.post('$baseUrl/kyc', data: formData,
        onSendProgress: (int sent, int total) {
      int totalPercentage = ((sent / total) * 100).toInt();

      AwesomeNotifications().createNotification(
          content: NotificationContent(
              id: 10,
              channelKey: 'basic_channel',
              title: 'uploading document',
              body: 'kyc',
              progress: totalPercentage,
              notificationLayout: NotificationLayout.ProgressBar));
      print(totalPercentage);
    },
        options: Options(validateStatus: (status) => true, headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $userToken',
        }));

    print(response.data.toString());
    if (response.statusCode == 201) {
      Get.rawSnackbar(message: "Kyc profile uploaded sucessfully");
    } else {
      Get.rawSnackbar(message: "Error uploading Kyc profle");
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
