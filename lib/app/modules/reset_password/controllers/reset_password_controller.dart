
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxBool isLoading = false.obs;

  void login() async {
    if (email.value.isEmpty || password.value.isEmpty) {
      Get.snackbar('Error', 'Please fill in both email and password');
      return;
    }

    if (!GetUtils.isEmail(email.value)) {
      Get.snackbar('Error', 'Please enter a valid email address');
      return;
    }

    if (password.value.length < 6) {
      Get.snackbar('Error', 'Password must be at least 6 characters');
      return;
    }

    try {
      isLoading.value = true;
      await Future.delayed(Duration(seconds: 2));

      Get.offNamed('/home');
    } catch (e) {
      Get.snackbar('Error', 'Login failed. Please try again.');
    } finally {
      isLoading.value = false;
    }
  }

  void googleLogin() {
    Get.snackbar('Info', 'Google login not implemented yet');
  }

  void facebookLogin() {
    Get.snackbar('Info', 'Facebook login not implemented yet');
  }
}