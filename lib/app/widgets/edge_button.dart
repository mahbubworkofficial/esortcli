import 'package:flutter/material.dart';

class EdgeButton extends StatelessWidget {
  const EdgeButton({
    super.key,
    required this.buttonColor,
    required this.textColor,
    required this.title,
    required this.onPress,
    this.width = 165,
    this.height = 57,
    this.loading = false,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w700,
    this.fontFamily = 'Urbanist',
  });

  final bool loading;
  final String title,fontFamily;
  final double height, width, fontSize;
  final VoidCallback onPress;
  final Color textColor, buttonColor;
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
          borderRadius: BorderRadius.circular(10),
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