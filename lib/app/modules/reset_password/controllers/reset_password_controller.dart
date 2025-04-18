// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../routes/app_pages.dart';
// import '../../../utils/utils.dart';
// import '../../splash/controllers/user_preferece_controller.dart';
// import '../bindings/user_model.dart';
// import '../repository/login_repository.dart';
//
// class LoginController extends GetxController {
//   final _api = LoginRepository();
//
//   UserPreferece userPreferece = UserPreferece();
//
//   final emailcontroller = TextEditingController().obs;
//   final passwordcontroller = TextEditingController().obs;
//
//   final emailFocusNode = FocusNode().obs;
//   final passwordFocusNode = FocusNode().obs;
//
//   RxBool loading = false.obs;
//
//   void loginApi() {
//     loading.value = true;
//     Map data = {
//       'email': emailcontroller.value.text,
//       'password': passwordcontroller.value.text,
//     };
//     _api
//         .loginApi(data)
//         .then((value) {
//       loading.value = false;
//
//       if (value['error'] == 'user not found') {
//         Utils.SnackBar('Error', value['error']);
//       } else {
//         userPreferece
//             .saveUser(UserModel.fromJson(value))
//             .then((value) {
//           Get.delete<LoginController>();
//           Get.toNamed(Routes.HOME)!.then((value) {});
//           Utils.SnackBar('Success', 'Login Success');
//         }).onError((error, StackTrace) {
//
//         });
//       }
//     }).onError((error, stackTrace) {
//       print(error.toString());
//       loading.value = false;
//       Utils.SnackBar('Error', error.toString());
//     });
//   }
// }

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
    // Implement Google login logic here
    Get.snackbar('Info', 'Google login not implemented yet');
  }

  void facebookLogin() {
    // Implement Facebook login logic here
    Get.snackbar('Info', 'Facebook login not implemented yet');
  }
}