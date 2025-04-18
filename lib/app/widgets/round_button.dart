import 'package:flutter/material.dart';
import '../res/colors/app_color.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    super.key,
    this.buttonColor = AppColor.primaryButtonColor,
    this.textColor = AppColor.primaryTextColor,
    required this.title,
    required this.onPress,
    this.height = 64,
    this.loading = false,
  });

  final bool loading;
  final String title;
  final double height;
  final VoidCallback onPress;
  final Color textColor, buttonColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(95),
        ),
        child: Center(
          child:
          loading
              ? Center(child: const CircularProgressIndicator())
              : Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(
              color: textColor,
              fontSize: 18,
              fontWeight: FontWeight.w700,
              fontFamily: 'Urbanist',
            ),
          ),
        ),
      ),
    );
  }
}