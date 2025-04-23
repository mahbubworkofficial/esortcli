import 'package:esortcli/app/res/assests/image_assets.dart';
import 'package:esortcli/app/res/colors/app_color.dart';
import 'package:esortcli/app/widgets/input_text_widget.dart';
import 'package:esortcli/app/widgets/round_button.dart';
import 'package:esortcli/app/widgets/set_reminder_dialog/views/set_reminder_dialog_view.dart';
import 'package:esortcli/app/widgets/text_area_widget.dart';
import 'package:esortcli/app/widgets/update_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DailyTask extends StatelessWidget {
  DailyTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: AppColor.blackColor,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.95,
          minWidth: MediaQuery.of(context).size.width * 0.95,
          maxHeight: MediaQuery.of(context).size.height * 0.7,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: SvgPicture.asset(
                      ImageAssets.cross,
                      height: 24,
                      width: 24,
                      color: AppColor.defaultColor,
                    ),
                    onPressed: () => Get.back(),
                  ),
                ),
                Row(
                  children: [
                    Stack(
                      children: [
                        Row(
                          children: [
                            Container(width: 17, height: 5.5),
                            Container(
                              width: 20,
                              height: 27.5,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: AppColor.defaultColor,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: AppColor.defaultColor,
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: const Text(
                            'Daily',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: AppColor.defaultColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 15),
                    InkWell(
                      onTap: () {
                        Get.back();
                        Get.dialog(UpdateTask());
                      },
                      child: Stack(
                        children: [
                          Row(
                            children: [
                              Container(width: 25, height: 27.5),
                              Container(
                                width: 27,
                                height: 27.5,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: AppColor.blackColor,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: AppColor.blackColor,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            child: const Text(
                              'Unique',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: AppColor.whiteColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                InputTextWidget(
                  borderRadius: 0,
                  height: 30,
                  hintText: 'Task Title',
                  hintTextColor: AppColor.hintTextColor,
                  hintfontWeight: FontWeight.w400,
                  hintfontSize: 20,
                  hintfontFamily: 'Roboto',
                  borderColor: AppColor.blackColor,
                  contentPadding: false,
                  onChanged: (value) {},
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a task title';
                    }
                    return null;
                  },
                ),
                Divider(color: AppColor.hintTextColor),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: InkWell(
                        onTap: () {
                          showSetReminderDialog(title: 'Set Time');
                        },
                        child: InputTextWidget(
                          borderRadius: 10,
                          height: 40,
                          hintText: ' Time',
                          hintTextColor: AppColor.hintTextColor,
                          hintfontWeight: FontWeight.w400,
                          hintfontSize: 20,
                          hintfontFamily: 'Roboto',
                          borderColor: AppColor.defaultOpacity2Color,
                          clockImage: true,
                          vertical: 6,
                          backgroundColor: AppColor.backgroundColor,
                          onChanged: (value) {},
                          validator: (value) {
                            return null;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: InkWell(
                        onTap: () {
                          showSetReminderDialog();
                        },
                        child: InputTextWidget(
                          borderRadius: 10,
                          height: 40,
                          hintText: ' Reminder',
                          hintTextColor: AppColor.hintTextColor,
                          hintfontWeight: FontWeight.w400,
                          hintfontSize: 20,
                          hintfontFamily: 'Roboto',
                          reminderImage: true,
                          vertical: 6,
                          borderColor: AppColor.defaultOpacity2Color,
                          backgroundColor: AppColor.backgroundColor,
                          onChanged: (value) {},
                          validator: (value) {
                            return null;
                          },
                        ),
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
                  onChanged: (value) {},
                  maxLines: 10,
                  validator: (value) {
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                RoundButton(
                  title: "Update Task",
                  onPress: () {
                    Get.back(); // Close the dialog
                  },
                  buttonColor: AppColor.defaultColor,
                  textColor: AppColor.whiteColor,
                  height: 53,
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  radius: 10,
                  width: double.infinity,
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
