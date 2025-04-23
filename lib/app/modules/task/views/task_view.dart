import 'package:esortcli/app/res/assests/image_assets.dart';
import 'package:esortcli/app/res/colors/app_color.dart';
import 'package:esortcli/app/widgets/calender.dart';
import 'package:esortcli/app/widgets/input_text_widget.dart';
import 'package:esortcli/app/widgets/round_button.dart';
import 'package:esortcli/app/widgets/set_reminder_dialog/views/set_reminder_dialog_view.dart';
import 'package:esortcli/app/widgets/text_area_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TaskView extends StatelessWidget {
  TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                  const SizedBox(height: 10),
                  Calender(),
                  const SizedBox(height: 24),
                  InputTextWidget(
                    borderRadius: 0,
                    height: 30,
                    hintText: ' Task Title',
                    hintTextColor: AppColor.hintTextColor,
                    hintfontWeight: FontWeight.w400,
                    hintfontSize: 20,
                    hintfontFamily: 'Roboto',
                    borderColor: AppColor.blackColor,
                    contentPadding: false,
                    onChanged: (value) {

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
                  Divider(color: AppColor.hintTextColor,),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){showSetReminderDialog(title: 'Set Time');},
                        child: InputTextWidget(
                          borderRadius: 10,
                          height: 40,
                          width: 190,
                          hintText: ' Time',
                          hintTextColor: AppColor.hintTextColor,
                          hintfontWeight: FontWeight.w400,
                          hintfontSize: 20,
                          hintfontFamily: 'Roboto',
                          borderColor: AppColor.defaultOpacity2Color,
                          clockImage: true,
                          vertical: 6,
                          backgroundColor: AppColor.backgroundColor,
                          onChanged: (value) {

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
                      const SizedBox(height: 5),
                      InkWell(
                        onTap: (){showSetReminderDialog();},
                        child: InputTextWidget(
                          borderRadius: 10,
                          height: 40,
                          width: 190,
                          hintText: ' Reminder',
                          hintTextColor: AppColor.hintTextColor,
                          hintfontWeight: FontWeight.w400,
                          hintfontSize: 20,
                          hintfontFamily: 'Roboto',
                          reminderImage: true,
                          vertical: 6,
                          borderColor: AppColor.defaultOpacity2Color,
                          backgroundColor: AppColor.backgroundColor,
                          onChanged: (value) {

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
                  InputTextWidget(
                    borderRadius: 10,
                    height: 140,
                    hintText: 'Needs',
                    hintTextColor: AppColor.whiteColor,
                    hintfontWeight: FontWeight.w400,
                    hintfontSize: 16,
                    hintfontFamily: 'Roboto',
                    borderColor: AppColor.defaultOpacity2Color,
                    onChanged: (value) {

                    },
                    maxLines: 10,
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
              Column(
                children: [
                  const SizedBox(height: 20),
                  RoundButton(
                    title: "Edit",
                    onPress: () {},
                    buttonColor: AppColor.defaultColor,
                    textColor: AppColor.whiteColor,
                    height: 53,
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    radius: 10,
                  ),
                  const SizedBox(height: 15),
                  RoundButton(
                    title: "Delete",
                    onPress: () {},
                    buttonColor: AppColor.blackColor,
                    textColor: AppColor.defaultColor,
                    borderColor: AppColor.defaultColor,
                    height: 53,
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    radius: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
