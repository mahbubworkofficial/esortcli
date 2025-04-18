import 'package:dots_indicator/dots_indicator.dart';
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
    const Color textColor = Color(0xFFFFFFFF);
    const Color descriptionColor = Color(0xFF6B6B6B);
    const Color dotColor = Color(0xFF8AB19B);
    const Color inactiveDotColor = Color(0xFFD3D3D3);

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
            color: inactiveDotColor,
            activeColor: dotColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
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
                    color: textColor,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: descriptionColor,
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
