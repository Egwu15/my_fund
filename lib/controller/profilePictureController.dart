import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_uploader/flutter_uploader.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_fund/controller/profileStorage.dart';
import 'package:my_fund/controller/user.dart';
import 'package:my_fund/models/userModel.dart';

class ProfilePictureController {
  final uploader = FlutterUploader();
  

  late String _path;
  final picker = ImagePicker();
  String baseUrl = dotenv.env['BASE_URL'] ?? "domain";

  Future getDocFromCamera() async {
    final pickedFile = await picker.pickImage(
        source: ImageSource.camera, preferredCameraDevice: CameraDevice.front);

    _path = pickedFile!.path;
    print(pickedFile.path + pickedFile.name);

    uploadDoc(path: _path);
  }

  Future getDocFromGallary() async {
    FlutterUploader().clearUploads();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    print("object");
    _path = pickedFile!.path;
    print(pickedFile.path + pickedFile.name);

    uploadDoc(path: _path);
  }

  uploadDoc({
    required String path,
  }) async {
    var userToken = await HiveStorage().getToken();

    Get.back();
    Get.rawSnackbar(message: "uploading ...");

    var formData = FormData.fromMap({
      'picture': await MultipartFile.fromFile(path, filename: 'upload.jpg'),
    });

    var dio = Dio();
    Response response = await dio.post('$baseUrl/picture', data: formData,
        onSendProgress: (int sent, int total) {
      int totalPercentage = ((sent / total) * 100).toInt();

      AwesomeNotifications().createNotification(
          content: NotificationContent(
              id: 12,
              channelKey: 'basic_channel',
              title: 'uploading Image',
              body: 'Profile Image',
              progress: totalPercentage,
              notificationLayout: NotificationLayout.ProgressBar));
      print(totalPercentage);
    },
        options: Options(validateStatus: (status) => true, headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $userToken',
        }));

    print(response.data.toString());
    if (response.statusCode == 200) {
      Get.rawSnackbar(message: "profile Picture uploaded sucessfully");
      AwesomeNotifications().createNotification(
          content: NotificationContent(
        id: 12,
        channelKey: 'basic_channel',
        title: 'Upload Complete',
        body: 'Profile Image uploaded',
      ));
      UserData().fetchUser();
    } else {
      Get.rawSnackbar(message: "Error uploading profle picture");
    }
  }
}
