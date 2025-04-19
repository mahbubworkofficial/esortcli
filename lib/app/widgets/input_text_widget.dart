import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../res/assests/image_assets.dart';
import '../res/colors/app_color.dart';

class InputTextWidget extends StatelessWidget {
  const InputTextWidget({
    super.key,
    this.hintText = '',
    required this.onChanged,
    this.validator,
    this.obscureText = false,
    this.showImage = false, // New parameter to control image visibility
    this.borderRadius = 10.0,
    this.borderColor = AppColor.defaultColor,
    this.hintTextColor = AppColor.hintTextColor,
    this.textColor = AppColor.whiteColor,
    this.height = 55.0,
    this.width = double.infinity,
    this.hintfontFamily = 'Urbanist',
    this.hintfontSize = 18.0,
    this.hintfontWeight = FontWeight.w500,
    this.fontSize = 18.0,
    this.fontWeight = FontWeight.w500,
    this.fontFamily = 'Urbanist',
  });

  final String hintText, hintfontFamily, fontFamily;
  final double borderRadius, fontSize, hintfontSize;
  final Color borderColor, textColor, hintTextColor;
  final double height, width;
  final bool obscureText, showImage; // Added showImage
  final ValueChanged<String> onChanged;
  final String? Function(String?)? validator;
  final FontWeight fontWeight, hintfontWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        children: [
          // TextField with constrained width
          Expanded(
            child: TextField(
              onChanged: onChanged,
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
                contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              ),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: fontSize,
                fontWeight: fontWeight,
                fontFamily: fontFamily,
                color: textColor,
              ),
            ),
          ),
          // Conditionally show SVG icon
          if (showImage)
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: SvgPicture.asset(
                ImageAssets.birthday,
                width: 24,
                height: 24,
              ),
            ),
        ],
      ),
    );
  }
}