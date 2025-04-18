import 'package:esortcli/app/widgets/input_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../res/colors/app_color.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/edge_button.dart';
import '../../../widgets/round_button.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 25,right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Image.asset('assets/images/welcome_logo.png'),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Log In',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w600,
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Email',
                          style: TextStyle(
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: InputTextWidget(
                          hintText: 'Enter your email',
                          onChanged: (value) {
                            controller.email.value = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!GetUtils.isEmail(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Password',
                          style: TextStyle(
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: InputTextWidget(
                          hintText: 'Enter your password',
                          obscureText: true,
                          onChanged: (value) {
                            controller.password.value = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                      Get.toNamed(Routes.FORGET_PASSWORD);
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: AppColor.redColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
                  Obx(() => RoundButton(
                    title: 'Log in',
                    loading: controller.isLoading.value,
                    onPress: () {
                      Get.toNamed(Routes.HOME);
                      if (_formKey.currentState!.validate()) {
                        controller.login();
                      }
                    },
                  )),
                  const SizedBox(height: 12,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'I don’t have an account. ',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Colors.white, // White color for "By Log up, "
                            ),
                          ),
                          WidgetSpan(
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(Routes.SIGN_UP);
                              },
                              child: Text(
                                'Sign UP',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: AppColor.defaultColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'By Log up, You’re agree to our ',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Colors.white, // White color for "By Log up, "
                            ),
                          ),
                          TextSpan(
                            text: 'Terms & Conditions',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: AppColor.defaultColor, // Original color for the rest
                            ),
                          ),
                          TextSpan(
                            text: ' and ',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Colors.white, // White color for "By Log up, "
                            ),
                          ),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: AppColor.defaultColor, // Original color for the rest
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Continue With Accounts',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xFFACADB9),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      EdgeButton(
                        title: 'GOOGLE',
                        onPress: () {
                          controller.googleLogin();
                        },
                        buttonColor: AppColor.googleButtonColor.withAlpha(65),
                        textColor: AppColor.googleTextColor,
                      ),
                      const SizedBox(width: 10),
                      EdgeButton(
                        title: 'FACEBOOK',
                        onPress: () {
                          controller.facebookLogin();
                        },
                        buttonColor: AppColor.facebookButtonColor.withAlpha(65),
                        textColor: AppColor.facebookTextColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}