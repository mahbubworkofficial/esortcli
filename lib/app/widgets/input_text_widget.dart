import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../res/assests/image_assets.dart';
import '../res/colors/app_color.dart';

class InputTextWidget extends StatefulWidget {
  const InputTextWidget({
    super.key,
    this.hintText = '',
    required this.onChanged,
    this.validator,
    this.obscureText = false,
    this.showImage = false,
    this.svgImagePath = ImageAssets.birthday, // For general image
    this.passwordIcon = ImageAssets.password, // Single SVG for password field
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
  final bool obscureText, showImage;
  final String svgImagePath; // General SVG image path
  final String passwordIcon; // Single SVG for password field
  final ValueChanged<String> onChanged;
  final String? Function(String?)? validator;
  final FontWeight fontWeight, hintfontWeight;

  @override
  _InputTextWidgetState createState() => _InputTextWidgetState();
}

class _InputTextWidgetState extends State<InputTextWidget> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText; // Initialize with widget's obscureText value
  }

  void _toggleObscure() {
    setState(() {
      _isObscured = !_isObscured; // Toggle the obscureText state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        border: Border.all(color: widget.borderColor),
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: Row(
        children: [
          // TextField with constrained width
          Expanded(
            child: TextField(
              onChanged: widget.onChanged,
              obscureText: _isObscured,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: widget.hintTextColor,
                  fontSize: widget.hintfontSize,
                  fontWeight: widget.hintfontWeight,
                  fontFamily: widget.hintfontFamily,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              ),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: widget.fontSize,
                fontWeight: widget.fontWeight,
                fontFamily: widget.fontFamily,
                color: widget.textColor,
              ),
            ),
          ),
          // General SVG image (e.g., birthday icon)
          if (widget.showImage)
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: SvgPicture.asset(
                widget.svgImagePath,
                width: 24,
                height: 24,
              ),
            ),
          // Single password SVG icon for password fields
          if (widget.obscureText)
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: GestureDetector(
                onTap: _toggleObscure, // Toggle obscureText on tap
                child: SvgPicture.asset(
                  widget.passwordIcon,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
        ],
      ),
    );
  }
}