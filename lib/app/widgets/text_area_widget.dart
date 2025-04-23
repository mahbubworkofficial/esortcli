import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../res/assests/image_assets.dart';
import '../res/colors/app_color.dart';

class TextAreaController extends GetxController {
  var isFocused = false.obs;

  void onFocusChange(bool hasFocus) {
    isFocused.value = hasFocus;
  }
}

class TextAreaWidget extends StatelessWidget {
  const TextAreaWidget({
    super.key,
    this.hintText = '',
    required this.onChanged,
    this.validator,
    this.showImage = false,
    this.clockImage = false,
    this.reminderImage = false,
    this.contentPadding = true,
    this.obscureText = true,
    this.svgImagePath = ImageAssets.birthday,
    this.reminder = ImageAssets.reminder,
    this.clock = ImageAssets.clock,
    this.borderRadius = 10.0,
    this.borderColor = AppColor.defaultColor,
    this.hintTextColor = AppColor.hintTextColor,
    this.textColor = AppColor.whiteColor,
    this.backgroundColor = AppColor.blackColor,
    this.height = 120.0,
    this.width = double.infinity,
    this.hintfontFamily = 'Urbanist',
    this.hintfontSize = 18.0,
    this.hintfontWeight = FontWeight.w500,
    this.fontSize = 18.0,
    this.fontWeight = FontWeight.w500,
    this.fontFamily = 'Urbanist',
    this.maxLines = 5,
  });

  final String hintText, hintfontFamily, fontFamily;
  final double borderRadius, fontSize, hintfontSize;
  final Color borderColor, textColor, hintTextColor,backgroundColor;
  final double height, width;
  final bool showImage, contentPadding, clockImage, reminderImage,obscureText;
  final String svgImagePath, clock, reminder;
  final ValueChanged<String> onChanged;
  final String? Function(String?)? validator;
  final FontWeight fontWeight, hintfontWeight;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      TextAreaController(),
      tag: UniqueKey().toString(),
    );

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: TextField(
              onChanged: onChanged,
              maxLines: maxLines,
              obscureText: obscureText,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: hintTextColor,
                  fontSize: hintfontSize,
                  fontWeight: hintfontWeight,
                  fontFamily: hintfontFamily,
                ),
                border: InputBorder.none,
                contentPadding:
                    contentPadding
                        ? const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        )
                        : null,
              ),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: fontSize,
                fontWeight: fontWeight,
                fontFamily: fontFamily,
                color: textColor,
              ),
              onTap: () => controller.onFocusChange(true),
              onEditingComplete: () => controller.onFocusChange(false),
            ),
          ),
          if (showImage)
            Padding(
              padding: const EdgeInsets.only(right: 15, top: 10),
              child: SvgPicture.asset(svgImagePath, width: 24, height: 24),
            ),
          if (reminderImage)
            Padding(
              padding: const EdgeInsets.only(right: 15, top: 10),
              child: SvgPicture.asset(reminder, width: 24, height: 24),
            ),
          if (clockImage)
            Padding(
              padding: const EdgeInsets.only(right: 15, top: 10),
              child: SvgPicture.asset(clock, width: 24, height: 24),
            ),
        ],
      ),
    );
  }
}
