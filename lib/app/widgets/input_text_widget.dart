import 'package:esortcli/app/widgets/set_reminder_dialog/views/set_reminder_dialog_view.dart';
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
    this.contentPadding = true,
    this.clockImage = false,
    this.reminderImage = false,
    this.svgImagePath = ImageAssets.birthday,
    this.passwordIcon = ImageAssets.password,
    this.reminder = ImageAssets.reminder,
    this.clock = ImageAssets.clock,
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
    this.vertical = 10.0,
    this.horizontal = 15.0,
  });

  final String hintText, hintfontFamily, fontFamily;
  final double borderRadius, fontSize, hintfontSize;
  final Color borderColor, textColor, hintTextColor;
  final double height, width, horizontal, vertical;
  final bool obscureText, showImage, contentPadding, clockImage, reminderImage;
  final String svgImagePath, clock, reminder;
  final String passwordIcon;
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
    _isObscured = widget.obscureText;
  }

  void _toggleObscure() {
    setState(() {
      _isObscured = !_isObscured;
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
                contentPadding:
                    widget.contentPadding
                        ? EdgeInsets.symmetric(
                          horizontal: widget.horizontal,
                          vertical: widget.vertical,
                        )
                        : null,
              ),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: widget.fontSize,
                fontWeight: widget.fontWeight,
                fontFamily: widget.fontFamily,
                color: widget.textColor,
              ),
            ),
          ),
          if (widget.showImage)
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: SvgPicture.asset(
                widget.svgImagePath,
                width: 24,
                height: 24,
              ),
            ),
          if (widget.obscureText)
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: GestureDetector(
                onTap: _toggleObscure,
                child: SvgPicture.asset(
                  widget.passwordIcon,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          if (widget.reminderImage)
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: SvgPicture.asset(
                ImageAssets.reminder,
                width: 24,
                height: 24,
              ),
            ),
          if (widget.clockImage)
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: SvgPicture.asset(ImageAssets.clock, width: 24, height: 24),
            ),
        ],
      ),
    );
  }
}
