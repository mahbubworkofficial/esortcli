import 'package:esortcli/app/widgets/input_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/round_button.dart';
import '../controllers/forget_password_controller.dart';

class ForgetPasswordView extends GetView<ForgetPasswordController> {
  ForgetPasswordView({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Initialize controller with GetX
    Get.put(ForgetPasswordController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 25,right: 25),
              child: Column(
                children: [
                  const SizedBox(height: 250,),
                  Text(
                    'Verify',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w700,
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 65),
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
                  Obx(() => RoundButton(
                    title: 'OTP',
                    loading: controller.isLoading.value,
                    onPress: () {
                      Get.toNamed(Routes.OTP);
                      if (_formKey.currentState!.validate()) {
                        controller.login();
                      }
                    },
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
