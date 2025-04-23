import 'package:esortcli/app/res/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> onboardingData = [
    {
      "image": "assets/images/image.png",
      "title": " Unlock the Power\n Of  Future AI",
      "description":
      "Chat with the smartest AI Future\n Experience power of AI with us",
      "arrow": "assets/images/arrow.png",
    },
    {
      "image": "assets/images/image2.png",
      "title": "Chat With Your\n Favourite Ai",
      "description":
      "Chat with the smartest AI Future\n Experience power of AI with us",
      "arrow": "assets/images/arrow2.png",
    },
    {
      "image": "assets/images/image3.png",
      "title": "Boost Your Mind\n Power with Ai",
      "description":
      "Chat with the smartest AI Future\n Experience power of AI with us",
      "arrow": "assets/images/arrow3.png",
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColor.blackColor,
      body: SafeArea(
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, right: 20),
              child: ElevatedButton(
                onPressed: () {
                  Get.offNamed(Routes.WELCOME);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.blackColor,
                  foregroundColor:AppColor.whiteColor,
                  textStyle: const TextStyle(
                    fontSize: 22,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                ),
                child: const Text('Skip'),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingData.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder:
                    (context, index) => OnboardingController(
                  imagePath: onboardingData[index]['image']!,
                  title: onboardingData[index]['title']!,
                  description: onboardingData[index]['description']!,
                  arrow: onboardingData[index]['arrow']!,
                  currentPage: _currentPage,
                  totalPages: onboardingData.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
