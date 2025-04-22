import 'package:esortcli/app/res/assests/image_assets.dart';
import 'package:esortcli/app/res/colors/app_color.dart';
import 'package:esortcli/app/widgets/round_button.dart';
import 'package:esortcli/app/widgets/set_reminder_dialog/controllers/set_reminder_dialog_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SetReminderDialog extends StatelessWidget {
  const SetReminderDialog({super.key, this.title = 'Set Reminder'});

  final String title;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SetReminderController());
    final List<String> hourList =
        List.generate(
          5,
          (_) => List.generate(12, (i) => (i + 1).toString().padLeft(2, '0')),
        ).expand((e) => e).toList();
    int middleChunkStart = (hourList.length ~/ 2) - 6;
    int selectedHour =
        controller.selectedHour.value == 0 ? 1 : controller.selectedHour.value;
    int initialHourIndex = hourList.indexOf(
      selectedHour.toString().padLeft(2, '0'),
      middleChunkStart,
    );
    final hourScrollController = FixedExtentScrollController(
      initialItem: initialHourIndex,
    );
    final List<String> minuteList =
        List.generate(
          5,
          (_) => List.generate(60, (i) => i.toString().padLeft(2, '0')),
        ).expand((e) => e).toList();
    int middleChunkStartMinute = (minuteList.length ~/ 2) - 30;
    int initialMinuteIndex = minuteList.indexOf(
      controller.selectedMinute.value.toString().padLeft(2, '0'),
      middleChunkStartMinute,
    );
    final minuteScrollController = FixedExtentScrollController(
      initialItem: initialMinuteIndex,
    );

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
                    SvgPicture.asset(ImageAssets.setTime),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Type in time',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColor.whiteColor,
                    fontFamily: 'Roboto',
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 40),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            final currentIndex =
                                hourScrollController.selectedItem;
                            final newIndex = currentIndex + 1;
                            hourScrollController.animateToItem(
                              newIndex,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                            final hourValue = int.parse(
                              hourList[newIndex % hourList.length],
                            );
                            controller.onHourChanged(hourValue);
                          },
                          child: SvgPicture.asset(ImageAssets.upper_arrow),
                        ),
                        SizedBox(
                          width: 50,
                          height: 80,
                          child: Obx(
                            () => ListWheelScrollView.useDelegate(
                              controller: hourScrollController,
                              itemExtent: 40,
                              onSelectedItemChanged: (index) {
                                final hourValue = int.parse(hourList[index]);
                                controller.onHourChanged(hourValue);
                              },
                              physics: const FixedExtentScrollPhysics(),
                              useMagnifier: true,
                              magnification: 1.2,
                              childDelegate: ListWheelChildLoopingListDelegate(
                                children: List.generate(hourList.length, (
                                  index,
                                ) {
                                  final displayHour = hourList[index];
                                  final isSelected =
                                      int.parse(displayHour) ==
                                      controller.selectedHour.value;
                                  return Center(
                                    child: Text(
                                      displayHour,
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            isSelected
                                                ? AppColor.defaultColor
                                                : AppColor.blackColor,
                                        fontFamily: 'Roboto',
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            final currentIndex =
                                hourScrollController.selectedItem;
                            final newIndex = currentIndex - 1;
                            hourScrollController.animateToItem(
                              newIndex,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                            final hourValue = int.parse(
                              hourList[newIndex % hourList.length],
                            );
                            controller.onHourChanged(hourValue);
                          },
                          child: SvgPicture.asset(ImageAssets.down_arrow),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Text(
                      ':',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: AppColor.whiteColor,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            int newMinute =
                                (controller.selectedMinute.value + 1) % 60;
                            controller.onMinuteChanged(newMinute);
                            minuteScrollController.animateToItem(
                              newMinute,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: SvgPicture.asset(ImageAssets.upper_arrow),
                        ),
                        SizedBox(
                          width: 50,
                          height: 80,
                          child: Obx(
                            () => ListWheelScrollView.useDelegate(
                              controller: minuteScrollController,
                              itemExtent: 40,
                              onSelectedItemChanged: (index) {
                                final minuteValue = int.parse(
                                  minuteList[index],
                                );
                                controller.onMinuteChanged(minuteValue);
                              },
                              physics: const FixedExtentScrollPhysics(),
                              useMagnifier: true,
                              magnification: 1.2,
                              childDelegate: ListWheelChildLoopingListDelegate(
                                children: List.generate(minuteList.length, (
                                  index,
                                ) {
                                  final displayMinute = minuteList[index];
                                  final isSelected =
                                      int.parse(displayMinute) ==
                                      controller.selectedMinute.value;

                                  return Center(
                                    child: Text(
                                      displayMinute,
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            isSelected
                                                ? AppColor.whiteColor
                                                : AppColor.blackColor,
                                        fontFamily: 'Roboto',
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            int newMinute =
                                (controller.selectedMinute.value - 1 + 60) % 60;
                            controller.onMinuteChanged(newMinute);
                            minuteScrollController.animateToItem(
                              newMinute,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: SvgPicture.asset(ImageAssets.down_arrow),
                        ),
                      ],
                    ),
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
                                horizontal: 5,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: AppColor.blackColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                'AM',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      controller.isAM.value
                                          ? AppColor.defaultColor
                                          : AppColor.whiteColor,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Obx(
                          () => GestureDetector(
                            onTap: () {
                              if (controller.isAM.value) {
                                controller.toggleAMPM();
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: AppColor.blackColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                'PM',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      controller.isAM.value
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
                    const SizedBox(height: 16),
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

                    const SizedBox(height: 16),
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
