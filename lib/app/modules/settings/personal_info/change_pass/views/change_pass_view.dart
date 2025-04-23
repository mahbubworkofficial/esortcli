import 'package:esortcli/app/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../res/assests/image_assets.dart';
import '../../../../../res/colors/app_color.dart';
import '../../../../../widgets/input_text_widget.dart';
import '../controllers/change_pass_controller.dart';

class ChangePassView extends GetView<ChangePassController> {
   ChangePassView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.blackColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            ImageAssets.back_button,
                            height: 24,
                            width: 12,
                          ),
                          const SizedBox(width: 10,),
                          Text(
                            'Back',
                            style: TextStyle(
                              color: AppColor.defaultColor,
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Password reset',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: AppColor.whiteColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'OLD Password',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        InputTextWidget(
                          hintText: '*********',
                          hintfontFamily: 'Poppins',
                          hintfontSize: 18,
                          hintfontWeight: FontWeight.w400,
                          hintTextColor: AppColor.whiteColor,
                          borderRadius: 30,
                          height: 52,
                          obscureText: true,
                          onChanged: (value) {
                            // controller.email.value = value;
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
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'New Password',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        InputTextWidget(
                          hintText: '*********',
                          hintfontFamily: 'Poppins',
                          hintfontSize: 18,
                          hintfontWeight: FontWeight.w400,
                          hintTextColor: AppColor.whiteColor,
                          borderRadius: 30,
                          height: 52,
                          obscureText: true,
                          onChanged: (value) {
                            // controller.email.value = value;
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
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Confirm Password',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        InputTextWidget(
                          hintText: '*********',
                          hintfontFamily: 'Poppins',
                          hintfontSize: 18,
                          hintfontWeight: FontWeight.w400,
                          hintTextColor: AppColor.whiteColor,
                          borderRadius: 30,
                          height: 52,
                          obscureText: true,
                          onChanged: (value) {
                            // controller.email.value = value;
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
                      ],
                    ),
                  ],
                ),
          
                Column(
                  children: [
                    const SizedBox(height: 35),
                    RoundButton(
                      title: "Save",
                      onPress: () {},
                      buttonColor: AppColor.defaultColor,
                      textColor: AppColor.whiteColor,
                      height: 53,
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      radius: 20,
                    ),
                    const SizedBox(height: 20),
                    RoundButton(
                      title: "Reset",
                      onPress: () {},
                      buttonColor: AppColor.blackColor,
                      textColor: AppColor.defaultColor,
                      borderColor: AppColor.defaultColor,
                      height: 53,
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      radius: 20,
                    ),
                    const SizedBox(height: 30,)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
