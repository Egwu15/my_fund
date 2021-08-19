import 'package:get/route_manager.dart';
import 'package:local_auth/local_auth.dart';
import 'package:my_fund/views/homePage.dart';

class LocalAuth {
  final LocalAuthentication localAuth = LocalAuthentication();
  Future<bool> checkAuth() async {
    bool canCheckBiometrics = await localAuth.canCheckBiometrics;

    return canCheckBiometrics;
  }

  authenticate() async {
    bool didAuthenticate = await localAuth.authenticate(
        localizedReason: 'Please authenticate to login', biometricOnly: true);
    if (didAuthenticate == true) {
      Get.offAll(() => HomePage());
    }
  }
}
