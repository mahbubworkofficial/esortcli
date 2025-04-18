import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/otp_input.dart';
import '../../../widgets/round_button.dart';
import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  OtpView({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Initialize controller with GetX
    Get.put(OtpController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                children: [
                  const SizedBox(height: 250),
                  Text(
                    'OTP',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w600,
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 95),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: OtpInputWidget(
                          onChanged: (value) {
                            controller.email.value = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your otp';
                            }
                            if (!GetUtils.isEmail(value)) {
                              return 'Please enter a valid otp';
                            }
                            return null;
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: OtpInputWidget(
                          onChanged: (value) {
                            controller.email.value = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your otp';
                            }
                            if (!GetUtils.isEmail(value)) {
                              return 'Please enter a valid otp';
                            }
                            return null;
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: OtpInputWidget(
                          onChanged: (value) {
                            controller.email.value = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your otp';
                            }
                            if (!GetUtils.isEmail(value)) {
                              return 'Please enter a valid otp';
                            }
                            return null;
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: OtpInputWidget(
                          onChanged: (value) {
                            controller.email.value = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your otp';
                            }
                            if (!GetUtils.isEmail(value)) {
                              return 'Please enter a valid otp';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Obx(
                    () => RoundButton(
                      title: 'Verify',
                      loading: controller.isLoading.value,
                      onPress: () {
                        Get.toNamed(Routes.RESET_PASSWORD);
                        if (_formKey.currentState!.validate()) {
                          controller.login();
                        }
                      },
                    ),
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
