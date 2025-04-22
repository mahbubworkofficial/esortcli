import 'package:esortcli/app/res/assests/image_assets.dart';
import 'package:esortcli/app/res/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SendDialog extends StatelessWidget {
  final VoidCallback onConfirm;
  final String message;

  const SendDialog({
    Key? key,
    required this.onConfirm,
    this.message = 'We are deeply sorry for the problem you\nare facing. We have received your\nmessage. We will contact you via email\nvery soon.',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: AppColor.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
            const SizedBox(height: 10),
            // Text message
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
            const SizedBox(height: 44),
            // OK button
            ElevatedButton(
              onPressed: () {
                onConfirm();
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.defaultColor,
                foregroundColor: AppColor.whiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: const Size(140, 41),
              ),
              child: const Text(
                'Cool',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppColor.whiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}