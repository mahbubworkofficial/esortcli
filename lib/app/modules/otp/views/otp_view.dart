import 'package:esortcli/app/res/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/round_button.dart';
import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  OtpView({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Get.put(OtpController());

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.blackColor,
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
                        color: AppColor.whiteColor,
                      ),
                    ),
                    const SizedBox(height: 95),
                    PinCodeTextField(
                      appContext: context,
                      length: 4,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      textStyle: const TextStyle(
                        color: AppColor.whiteColor,
                        fontSize: 20,
                      ),
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(10),
                        fieldHeight: 55,
                        fieldWidth: 60,
                        activeFillColor: AppColor.blackColor,
                        inactiveFillColor: AppColor.blackColor,
                        selectedFillColor: AppColor.blackColor,
                        activeColor: AppColor.defaultColor,
                        inactiveColor: AppColor.defaultColor,
                        selectedColor: AppColor.whiteColor,
                      ),
                      animationDuration: const Duration(milliseconds: 300),
                      backgroundColor: Colors.transparent,
                      enableActiveFill: true,
                      onChanged: (value) {
                        // controller.otp.value = value;
                      },
                      onCompleted: (value) {
                        // controller.otp.value = value;
                      },
                      validator: (value) {
                        if (value == null || value.length != 4) {
                          return 'Please enter a 4-digit OTP';
                        }
                        if (!GetUtils.isNumericOnly(value)) {
                          return 'OTP must be numeric';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    Obx(
                      () => RoundButton(
                        title: 'Verify',
                        loading: controller.isLoading.value,
                        onPress: () {
                          if (_formKey.currentState!.validate()) {
                            controller.login();
                            Get.toNamed(Routes.RESET_PASSWORD);
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
      ),
    );
  }
}
