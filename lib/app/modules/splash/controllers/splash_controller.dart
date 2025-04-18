
import 'dart:async';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/user_preferece_controller.dart';

class SplashController {

  UserPreferece userPreferece = UserPreferece();

  void isLogin(){

    userPreferece.getUser().then((value) {

      print(value.token);
      Timer(const Duration(seconds: 3), () {
        if (value.token == null || value.token!.trim().isEmpty) {
          Get.offNamed(Routes.LOGIN);
        } else {
          Get.offNamed(Routes.HOME);
        }
      });
    });
  }
}