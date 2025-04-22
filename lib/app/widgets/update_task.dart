import 'package:esortcli/app/res/assests/image_assets.dart';
import 'package:esortcli/app/res/colors/app_color.dart';
import 'package:esortcli/app/widgets/calender.dart';
import 'package:esortcli/app/widgets/daily_task.dart';
import 'package:esortcli/app/widgets/delete_dialog.dart';
import 'package:esortcli/app/widgets/input_text_widget.dart';
import 'package:esortcli/app/widgets/rename_dialog.dart';
import 'package:esortcli/app/widgets/round_button.dart';
import 'package:esortcli/app/widgets/set_reminder_dialog/views/set_reminder_dialog_view.dart';
import 'package:esortcli/app/widgets/text_area_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class UpdateTask extends StatelessWidget {
  UpdateTask({super.key});

  void _showPopupMenu(BuildContext context, Offset position) {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject()! as RenderBox;
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy,
        overlay.size.width - position.dx,
        overlay.size.height - position.dy,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      color: AppColor.grayColor,
      constraints: const BoxConstraints(maxWidth: 40, minWidth: 40),
      items: [
        PopupMenuItem(
          height: 60,
          padding: EdgeInsets.zero,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 50, minWidth: 50),
            child: ClipRect(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: SvgPicture.asset(
                      ImageAssets.delete,
                      color: AppColor.whiteColor,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Get.dialog(
                        DeleteDialog(
                          message: 'Do you want to delete the Note?',
                          onConfirm: () {},
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                    child: SvgPicture.asset(
                      ImageAssets.bell,
                      color: AppColor.whiteColor,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Get.dialog(
                        RenameDialog(
                          title: 'Rename the note?',
                          onConfirm: () {},
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                    child: SvgPicture.asset(
                      ImageAssets.task,
                      color: AppColor.whiteColor,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Get.dialog(RenameDialog(onConfirm: () {}));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
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

                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                              Get.dialog(DailyTask());
                            },
                            child: Stack(
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
                                    'Daily',
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
                          const SizedBox(width: 15),
                          Stack(
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
                                  'Unique',
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
                    Divider(color: AppColor.hintTextColor),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            showSetReminderDialog(title: 'Set Time');
                          },
                          child: InputTextWidget(
                            borderRadius: 10,
                            height: 50,
                            width: 180,
                            hintText: ' Time',
                            hintTextColor: AppColor.hintTextColor,
                            hintfontWeight: FontWeight.w400,
                            hintfontSize: 20,
                            hintfontFamily: 'Roboto',
                            borderColor: AppColor.defaultOpacity2Color,
                            clockImage: true,
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
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            showSetReminderDialog();
                          },
                          child: InputTextWidget(
                            borderRadius: 10,
                            height: 50,
                            width: 180,
                            hintText: ' Reminder',
                            hintTextColor: AppColor.hintTextColor,
                            hintfontWeight: FontWeight.w400,
                            hintfontSize: 20,
                            hintfontFamily: 'Roboto',
                            reminderImage: true,
                            borderColor: AppColor.defaultOpacity2Color,

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
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    TextAreaWidget(
                      borderRadius: 10,
                      height: 140,
                      hintText: 'Needs',
                      hintTextColor: AppColor.whiteColor,
                      hintfontWeight: FontWeight.w400,
                      hintfontSize: 16,
                      hintfontFamily: 'Roboto',
                      borderColor: AppColor.defaultOpacity2Color,
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
              ),
              RoundButton(
                title: "Update Task",
                onPress: () {},
                buttonColor: AppColor.defaultColor,
                textColor: AppColor.whiteColor,
                height: 53,
                fontFamily: 'Roboto',
                fontSize: 20,
                fontWeight: FontWeight.w500,
                radius: 10,
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
