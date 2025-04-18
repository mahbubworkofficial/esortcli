import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../res/assests/image_assets.dart';
import '../res/colors/app_color.dart';

class DeleteDialog extends StatelessWidget {
  final VoidCallback onConfirm;
  final String message;

  const DeleteDialog({
    Key? key,
    required this.onConfirm,
    this.message = 'Do you want to delete the Category?',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: AppColor.redBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Cross icon at top-right
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
                fontFamily: 'Lexend',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: AppColor.redTextColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 44),
            // OK button
            ElevatedButton(
              onPressed: () {
                onConfirm(); // Trigger confirmation action
                Get.back(); // Dismiss dialog after confirmation
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.redColor,
                foregroundColor: AppColor.whiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: const Size(120, 48),
              ),
              child: const Text(
                'OK',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
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