import 'package:flutter/material.dart';
import '../res/colors/app_color.dart';

class InputTextWidget extends StatelessWidget {
  const InputTextWidget({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.validator,
    this.obscureText = false,
    this.borderRadius = 10.0,
    this.borderColor = AppColor.defaultColor,
    this.height = 55.0,
  });

  final String hintText;
  final double borderRadius;
  final Color borderColor;
  final double height;
  final bool obscureText;
  final ValueChanged<String> onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: TextField(
        onChanged: onChanged,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
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