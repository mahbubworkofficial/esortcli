import 'package:flutter/material.dart';
import '../res/colors/app_color.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    super.key,
    this.buttonColor = AppColor.primaryButtonColor,
    this.textColor = AppColor.primaryTextColor,
    this.borderColor = AppColor.primaryButtonColor,
    required this.title,
    required this.onPress,
    this.height = 64,
    this.width = double.infinity,
    this.loading = false,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w700,
    this.fontFamily = 'Urbanist',
    this.radius = 95,
  });

  final bool loading;
  final String title, fontFamily;
  final double height, fontSize, radius, width;
  final VoidCallback onPress;
  final Color textColor, buttonColor, borderColor;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: borderColor, width: 1.0),
        ),
        child: Center(
          child:
              loading
                  ? Center(child: const CircularProgressIndicator())
                  : Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: textColor,
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                      fontFamily: fontFamily,
                    ),
                  ),
        ),
      ),
    );
  }
}
