import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../res/assests/image_assets.dart';
import '../controllers/splash_controller.dart';
import '../../../routes/app_pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashController splashController = SplashController();
  String assetName = ImageAssets.splashScreen;
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Get.offNamed(Routes.ONBOARDING);
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color backgroundColor = Color(0xFF000000 );
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: SizedBox(
            height: 400,
            width: 400,
            child:
            SvgPicture.asset(
              assetName,
              semanticsLabel: 'App Logo',
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );

  }
}














