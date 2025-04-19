import 'package:esortcli/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../res/assests/image_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../controllers/personal_info_controller.dart';

class PersonalInfoView extends GetView<PersonalInfoController> {
  const PersonalInfoView({super.key});

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
                        Container(
                          height: 21,
                          width: 160,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColor.defaultColor,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Name',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 42,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColor.defaultColor,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Mira',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: AppColor.whiteColor,
                          ),
                        ),
                        InkWell(
                          onTap: () => Get.toNamed(Routes.CHANGE_INFO),
                          child: SvgPicture.asset(
                            ImageAssets.task,
                            color: AppColor.defaultColor,
                          ),
                        ),
                      ],
                    ),
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
                    'Email',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 42,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColor.defaultColor,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'abc@gmail.com',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: AppColor.whiteColor,
                          ),
                        ),
                      ],
                    ),
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
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 42,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColor.defaultColor,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '*********',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: AppColor.whiteColor,
                          ),
                        ),
                        SvgPicture.asset(
                          ImageAssets.task,
                          color: AppColor.defaultColor,
                        ),
                      ],
                    ),
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
                    'Birth Day',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: 42,
                    width: 200,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColor.defaultColor,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'DD/MM/YY',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: AppColor.whiteColor,
                            ),
                          ),
                          SvgPicture.asset(ImageAssets.birthday),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
