import 'package:flutter/material.dart';
import '../res/colors/app_color.dart';

class InputResizeWidget extends StatelessWidget {
  const InputResizeWidget({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.validator,
    this.obscureText = false,
    this.borderRadius = 10.0,
    this.borderColor = AppColor.defaultColor,
    this.height = 55.0,
    this.width = double.infinity,
  });

  final String hintText;
  final double borderRadius;
  final Color borderColor;
  final double height;
  final double width;
  final bool obscureText;
  final ValueChanged<String> onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Color(0xFF1E1E1E),
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: TextField(
        onChanged: onChanged,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Color(0xFF7C7C7C),
            fontSize: 12,
            fontWeight: FontWeight.w400,
            fontFamily: 'Roboto',
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
        ),
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontFamily: 'Roboto',
          color: const Color(0xFFFFFFFF),
        ),
      ),
    );
  }
}
