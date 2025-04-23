import 'dart:io';
import 'package:esortcli/app/modules/settings/personal_info/controllers/image_picker_controller.dart';
import 'package:esortcli/app/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../res/assests/image_assets.dart';
import '../../../../../res/colors/app_color.dart';
import '../../../../../widgets/input_text_widget.dart';
import '../controllers/change_info_controller.dart';

class ChangeInfoView extends GetView<ChangeInfoController> {
  ChangeInfoView({super.key});
  final ImagePickerController ImagePickercontroller = Get.put(
    ImagePickerController(),
  );

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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(() {
                            return Stack(
                              alignment: Alignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 60,
                                  backgroundImage:
                                      ImagePickercontroller.imagePath.isNotEmpty
                                          ? FileImage(
                                            File(
                                              ImagePickercontroller.imagePath
                                                  .toString(),
                                            ),
                                          )
                                          : null,
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 15,
                                  child: InkWell(
                                    onTap: () {
                                      Get.bottomSheet(
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap:
                                                  () =>
                                                      ImagePickercontroller.getImage(
                                                        ImageSource.camera,
                                                      ),
                                              child: SvgPicture.asset(
                                                ImageAssets.camera,
                                                height: 150,
                                                width: 150,
                                              ),
                                            ),
                                            const SizedBox(width: 20),
                                            InkWell(
                                              onTap:
                                                  () =>
                                                      ImagePickercontroller.getImage(
                                                        ImageSource.gallery,
                                                      ),
                                              child: SvgPicture.asset(
                                                ImageAssets.folder,
                                                height: 150,
                                                width: 150,
                                                color: AppColor.defaultColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    child: SvgPicture.asset(ImageAssets.camera),
                                  ),
                                ),
                              ],
                            );
                          }),
                          const SizedBox(width: 20),
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
                                    fontSize: 14,
                                    vertical: 9,
                                    horizontal: 6,
                                    onChanged: (value) {},
                                    validator: (value) {
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
                            onChanged: (value) {},
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
                            onChanged: (value) {},
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
                                onChanged: (value) {},
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
                      Get.back();
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
