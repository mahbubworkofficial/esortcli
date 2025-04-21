import 'package:esortcli/app/res/assests/image_assets.dart';
import 'package:esortcli/app/res/colors/app_color.dart';
import 'package:esortcli/app/widgets/round_button.dart';
import 'package:esortcli/app/widgets/set_reminder_dialog/controllers/set_reminder_dialog_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SetReminderDialog extends StatelessWidget {
  const SetReminderDialog({
    super.key,
    this.title = 'Set Reminder',
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SetReminderController());
    final hourScrollController = FixedExtentScrollController(initialItem: controller.selectedHour.value - 1);
    final minuteScrollController = FixedExtentScrollController(initialItem: controller.selectedMinute.value);

    return Dialog(
      backgroundColor: AppColor.blackColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Obx(
                  () => Text(
                controller.getFormattedDate(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColor.whiteColor,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColor.whiteColor,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    SvgPicture.asset(
                      ImageAssets.setTime,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            int currentIndex = controller.selectedHour.value;
                            int newIndex = (currentIndex + 1) % 12;
                            controller.onHourChanged(newIndex);
                            hourScrollController.animateToItem(
                              newIndex,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: SvgPicture.asset(
                            ImageAssets.upper_arrow,
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: 50,
                          height: 80,
                          child: Obx(
                                () => ListWheelScrollView.useDelegate(
                              controller: hourScrollController,
                              itemExtent: 40,
                              onSelectedItemChanged: controller.onHourChanged,
                              physics: const FixedExtentScrollPhysics(),
                              useMagnifier: true,
                              magnification: 1.2,
                              childDelegate: ListWheelChildLoopingListDelegate(
                                children: List.generate(
                                  12,
                                      (index) => Center(
                                    child: Text(
                                      (index + 1).toString().padLeft(2, '0'), // Shows 01 to 12
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                        color: controller.selectedHour.value == index
                                            ? AppColor.defaultColor
                                            : AppColor.hintTextColor,
                                        fontFamily: 'Roboto',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        GestureDetector(
                          onTap: () {
                            int currentIndex = controller.selectedHour.value;
                            int newIndex = (currentIndex - 1 + 12) % 12;
                            controller.onHourChanged(newIndex);
                            hourScrollController.animateToItem(
                              newIndex,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: SvgPicture.asset(
                            ImageAssets.down_arrow,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 28),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            int newMinute = (controller.selectedMinute.value + 1) % 60;
                            controller.onMinuteChanged(newMinute);
                            minuteScrollController.animateToItem(
                              newMinute,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: SvgPicture.asset(
                            ImageAssets.upper_arrow,
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: 50,
                          height: 80,
                          child: Obx(
                                () => ListWheelScrollView.useDelegate(
                              controller: minuteScrollController,
                              itemExtent: 40,
                              onSelectedItemChanged: controller.onMinuteChanged,
                              physics: const FixedExtentScrollPhysics(),
                              useMagnifier: true,
                              magnification: 1.2,
                              childDelegate: ListWheelChildLoopingListDelegate(
                                children: List.generate(
                                  60,
                                      (index) => Center(
                                    child: Text(
                                      index.toString().padLeft(2, '0'),
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                        color: controller.selectedMinute.value == index
                                            ? AppColor.whiteColor
                                            : AppColor.hintTextColor,
                                        fontFamily: 'Roboto',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        GestureDetector(
                          onTap: () {
                            int newMinute = (controller.selectedMinute.value - 1 + 60) % 60;
                            controller.onMinuteChanged(newMinute);
                            minuteScrollController.animateToItem(
                              newMinute,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: SvgPicture.asset(
                            ImageAssets.down_arrow,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    // AM/PM Buttons in a Column
                    Column(
                      children: [
                        Obx(
                              () => GestureDetector(
                            onTap: () {
                              if (!controller.isAM.value) {
                                controller.toggleAMPM();
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: AppColor.blackColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                'AM',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: controller.isAM.value
                                      ? AppColor.defaultColor
                                      : AppColor.whiteColor,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Obx(
                              () => GestureDetector(
                            onTap: () {
                              if (controller.isAM.value) {
                                controller.toggleAMPM();
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: AppColor.blackColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                'PM',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: controller.isAM.value
                                      ? AppColor.whiteColor
                                      : AppColor.defaultColor,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RoundButton(
                      title: 'Cancel',
                      textColor: AppColor.whiteColor,
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      onPress: controller.onCancel,
                      width: 110,
                      height: 45,
                      borderColor: AppColor.defaultColor,
                      buttonColor: AppColor.blackColor,
                      radius: 10,
                    ),
                    RoundButton(
                      title: 'Done',
                      textColor: AppColor.whiteColor,
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      onPress: controller.onDone,
                      width: 110,
                      height: 45,
                      borderColor: AppColor.defaultColor,
                      buttonColor: AppColor.defaultColor,
                      radius: 10,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void showSetReminderDialog({String title = 'Set Reminder'}) {
  Get.dialog(SetReminderDialog(title: title));
}