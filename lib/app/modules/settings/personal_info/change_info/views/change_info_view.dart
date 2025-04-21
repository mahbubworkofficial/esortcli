import 'package:esortcli/app/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../res/assests/image_assets.dart';
import '../../../../../res/colors/app_color.dart';
import '../../../../../widgets/input_text_widget.dart';
import '../controllers/change_info_controller.dart';

class ChangeInfoView extends GetView<ChangeInfoController> {
  const ChangeInfoView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackColor,
      appBar: AppBar(
        backgroundColor: AppColor.blackColor,
        leading: IconButton(
          icon: SvgPicture.asset(
            ImageAssets.back_button,
            height: 24,
            width: 12,
          ),
          onPressed: () => Get.back(),
        ),
        title: InkWell(
          onTap: () => Get.back(),
          child: Text(
            'Back',
            style: TextStyle(
              color: AppColor.defaultColor,
              fontWeight: FontWeight.w500,
              fontSize: 16,
              fontFamily: 'Roboto',
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Personal Information',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: AppColor.whiteColor,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        // Base image
                        Image.asset(
                          'assets/images/img.png',
                          width: 130,
                          height: 130,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 15,
                          child: SvgPicture.asset(ImageAssets.camera),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Mira',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 30,
                            color: AppColor.whiteColor,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              'Bio:',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: AppColor.whiteColor,
                              ),
                            ),
                            const SizedBox(width: 5),
                            InputTextWidget(
                              borderRadius: 10,
                              height: 21,
                              width: 160,
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
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Name',
                        style: TextStyle(
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    InputTextWidget(
                      hintText: 'Mira',
                      hintfontFamily: 'Poppins',
                      hintfontSize: 18,
                      hintfontWeight: FontWeight.w400,
                      hintTextColor: AppColor.whiteColor,
                      borderRadius: 30,
                      height: 42,
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
                    InputTextWidget(
                      hintText: 'abc@gmail.com',
                      hintfontFamily: 'Poppins',
                      hintfontSize: 18,
                      hintfontWeight: FontWeight.w400,
                      hintTextColor: AppColor.whiteColor,
                      borderRadius: 30,
                      height: 42,
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
                // Password Field
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Birth Day',
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
                      alignment: Alignment.topLeft,
                      child: InputTextWidget(
                        hintText: 'DD/MM/YY',
                        hintfontFamily: 'Poppins',
                        hintfontSize: 18,
                        hintfontWeight: FontWeight.w400,
                        hintTextColor: AppColor.whiteColor,
                        borderRadius: 30,
                        height: 42,
                        width: 200,
                        showImage: true,
                        onChanged: (value) {
                          // controller.password.value = value;
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
              ],
            ),
            Column(
              children: [
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
                const SizedBox(height: 35,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
