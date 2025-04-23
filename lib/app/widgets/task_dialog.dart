import 'package:esortcli/app/widgets/round_button.dart';
import 'package:esortcli/app/widgets/set_reminder_dialog/views/set_reminder_dialog_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../res/assests/image_assets.dart';
import '../res/colors/app_color.dart';

class TaskDialog extends StatefulWidget {
  final VoidCallback onConfirm;

  const TaskDialog({Key? key, required this.onConfirm}) : super(key: key);

  @override
  _TaskDialogState createState() => _TaskDialogState();
}

class _TaskDialogState extends State<TaskDialog> {
  bool _isYesChecked = true;
  bool _isNoChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: AppColor.backgroundColor,
        child: Column(
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'Do you want to reschedule the tasks?',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: AppColor.whiteColor,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: _isYesChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            _isYesChecked = value ?? false;
                            if (_isYesChecked) {
                              _isNoChecked = false;
                            }
                          });
                        },
                        activeColor: AppColor.defaultColor,
                        checkColor: AppColor.whiteColor,
                        side: BorderSide(
                          color: AppColor.defaultColor,
                          width: 2,
                        ),
                      ),
                      const Text(
                        'Yes',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppColor.whiteColor,
                        ),
                      ),
                      const SizedBox(width: 30),
                      Checkbox(
                        value: _isNoChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            _isNoChecked = value ?? false;
                            if (_isNoChecked) {
                              _isYesChecked = false;
                            }
                          });
                        },
                        activeColor: AppColor.defaultColor,
                        checkColor: AppColor.whiteColor,
                        side: BorderSide(
                          color: AppColor.defaultColor,
                          width: 2,
                        ),
                      ),
                      const Text(
                        'No',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppColor.whiteColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  RoundButton(
                    title: 'Go',
                    onPress: () {
                      if (_isYesChecked) {
                        widget.onConfirm();
                        showSetReminderDialog(
                          title: 'How many Times you want shift\neach task',
                        );
                      }
                    },
                    height: 45,
                    radius: 10,
                    buttonColor: AppColor.defaultColor,
                    textColor: AppColor.whiteColor,
                    fontFamily: "Roboto",
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
