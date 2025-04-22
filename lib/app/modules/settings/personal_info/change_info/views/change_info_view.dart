import 'package:esortcli/app/modules/settings/personal_info/controllers/image_picker_controller.dart';
import 'package:esortcli/app/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../res/assests/image_assets.dart';
import '../../../../../res/colors/app_color.dart';
import '../../../../../widgets/input_text_widget.dart';
import '../controllers/change_info_controller.dart';

class ChangeInfoView extends GetView<ChangeInfoController> {
  ChangeInfoView({super.key});
  final ImagePickerController imagePickerController = Get.put(ImagePickerController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.blackColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
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
                            const SizedBox(width: 10),
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
                      const SizedBox(height: 20),
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
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                'assets/images/img.png',
                                width: 130,
                                height: 130,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                bottom: 0,
                                right: 15,
                                child: InkWell(
                                  onTap: () {
                                    imagePickerController.getImage();
                                  },
                                  child: SvgPicture.asset(ImageAssets.camera),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                    Expanded(
                                      child: InputTextWidget(
                                        borderRadius: 10,
                                        height: 21,
                                        contentPadding: false,
                                        onChanged: (value) {
                                          // Update bio in controller if needed
                                        },
                                        validator: (value) {
                                          return null; // Remove email validation for bio
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
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
                              // Update name in controller if needed
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
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
                              // Update email in controller if needed
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
                            child: SizedBox(
                              width: 200,
                              child: InputTextWidget(
                                hintText: 'DD/MM/YY',
                                hintfontFamily: 'Poppins',
                                hintfontSize: 18,
                                hintfontWeight: FontWeight.w400,
                                hintTextColor: AppColor.whiteColor,
                                borderRadius: 30,
                                height: 42,
                                showImage: true,
                                onChanged: (value) {
                                  // Update birthday in controller if needed
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your birthday';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  RoundButton(
                    title: "Save",
                    onPress: () {
                      Get.back(); // Close the screen
                    },
                    buttonColor: AppColor.defaultColor,
                    textColor: AppColor.whiteColor,
                    height: 53,
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    radius: 20,
                    width: double.infinity,
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
                    width: double.infinity,
                  ),
                  const SizedBox(height: 35),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}