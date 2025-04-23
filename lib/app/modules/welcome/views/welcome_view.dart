
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../res/colors/app_color.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/round_button.dart';
import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 25,right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Image.asset('assets/images/welcome_logo.png'),
                ),
                const SizedBox(height: 50,),
                Text(
                  'Welcome to\neSort',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w600,
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 60),
                RoundButton(
                  buttonColor: AppColor.secondaryButtonColor,
                  textColor: AppColor.whiteColor,
                  borderColor: AppColor.secondaryButtonColor,
                  title: 'Log in',
                  onPress: () {
                    Get.toNamed(Routes.LOGIN);
                  },
                ),
                const SizedBox(height: 25),
                RoundButton(
                  title: 'Sign Up',
                  onPress: () {
                    Get.toNamed(Routes.SIGN_UP);
                  },
                ),
                const SizedBox(height: 40),
                Text(
                  'Continue With Accounts',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0XFFACADB9),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundButton(
                      height: 57,
                      width: 165,
                      radius: 10,
                      title: 'GOOGLE',
                      onPress: () {
                        Get.toNamed(Routes.LOGIN);
                      }, buttonColor: AppColor.googleButtonColor.withAlpha(65),
                      textColor: AppColor.googleTextColor,
                    ),
                    const SizedBox(width: 10,),
                    RoundButton(
                      height: 57,
                      width: 165,
                      radius: 10,
                      title: 'FACEBOOK',
                      onPress: () {
                        Get.toNamed(Routes.LOGIN);
                      }, buttonColor: AppColor.facebookButtonColor.withAlpha(65),
                      textColor: AppColor.facebookTextColor,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
