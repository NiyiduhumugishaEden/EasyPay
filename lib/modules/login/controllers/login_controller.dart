import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class LoginController extends GetxController {
  void login() {
    // In a real app, you would validate credentials here
    Get.offAllNamed(Routes.HOME);
  }

  void goToSignUp() {
    // Navigate to sign up page
  }
}
