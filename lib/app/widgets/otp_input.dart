import 'package:flutter/material.dart';
import '../res/colors/app_color.dart';

class OtpInputWidget extends StatelessWidget {
  const OtpInputWidget({
    super.key,
    required this.onChanged,
    this.validator,
    this.borderRadius = 10.0,
    this.borderColor = AppColor.defaultColor,
    this.height = 55.0,
    this.width = 60.0,

  });

  final double borderRadius;
  final Color borderColor;
  final double height, width;
  final ValueChanged<String> onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        ),
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          fontFamily: 'Urbanist',
          color: Color(0xFFFFFFFF)
        ),
      ),
    );
  }
}