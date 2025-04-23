import 'package:dots_indicator/dots_indicator.dart';
import 'package:esortcli/app/res/colors/app_color.dart';
import 'package:flutter/material.dart';

class OnboardingController extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String arrow;
  final int currentPage;
  final int totalPages;

  const OnboardingController({
    super.key,
    required this.title,
    required this.description,
    required this.arrow,
    required this.imagePath,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Center(child: Image.asset(imagePath, fit: BoxFit.contain)),
        ),
        const SizedBox(height: 10),
        DotsIndicator(
          dotsCount: totalPages,
          position: currentPage.toDouble(),
          decorator: DotsDecorator(
            color: AppColor.hintTextColor,
            activeColor: AppColor.whiteColor,
            size: const Size.square(10.0),
            activeSize: const Size(15.0, 15.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        const SizedBox(height: 30),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: AppColor.whiteColor,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    color: AppColor.hintTextColor,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Poppins',
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Center(child: Image.asset(arrow, fit: BoxFit.contain)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
