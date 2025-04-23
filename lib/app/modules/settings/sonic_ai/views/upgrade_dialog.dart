import 'package:esortcli/app/res/assests/image_assets.dart';
import 'package:esortcli/app/res/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class UpgradeDialog extends StatelessWidget {
  final VoidCallback onConfirm;
  final String message;

  const UpgradeDialog({
    Key? key,
    required this.onConfirm,
    this.message =
        'Congratulations! You\'ve successfully upgraded to\nSonic AI Pro. Enjoy enhanced features',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: AppColor.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              SvgPicture.asset(ImageAssets.upgrade),
              const SizedBox(height: 10),
              Text(
                'Upgraded to Sonic AI Pro!',
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  color: AppColor.whiteColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                message,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: Color(0xFFB0B0B0),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  onConfirm();
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.backgroundColor,
                  foregroundColor: AppColor.whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  minimumSize: const Size(double.infinity, 41),
                ),
                child: const Text(
                  'Explore',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColor.whiteColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
