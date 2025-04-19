import 'package:esortcli/app/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../res/colors/app_color.dart';

class SettingsPopView extends StatelessWidget {
  final VoidCallback onConfirm;
  final String message;

  const SettingsPopView({
    Key? key,
    required this.onConfirm,
    this.message = 'Are you sure you want to delete all your data?',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: AppColor.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            Text(
              message,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: AppColor.whiteColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 54),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RoundButton(
                  title: 'OK',
                  onPress: () {
                    onConfirm();
                    Get.back();
                  },
                  borderColor: AppColor.redButtonColor,
                  buttonColor: AppColor.redButtonColor,
                  textColor: AppColor.whiteButtonColor,
                  width: 134,
                  height: 41,
                  radius: 20,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                ),
                RoundButton(
                  title: 'Cancel',
                  onPress: () {
                    onConfirm();
                    Get.back();
                  },
                  borderColor: AppColor.defaultColor,
                  buttonColor: AppColor.backgroundColor,
                  textColor: AppColor.defaultColor,
                  width: 134,
                  height: 41,
                  radius: 20,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
