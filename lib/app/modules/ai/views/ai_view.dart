import 'package:esortcli/app/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../res/assests/image_assets.dart';
import '../../../res/colors/app_color.dart';
import '../../../routes/app_pages.dart';
import '../controllers/ai_controller.dart';

class AiView extends GetView<AiController> {
  const AiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackColor,
      // appBar: AppBar(
      //   backgroundColor: AppColor.blackColor,
      //   leading: IconButton(
      //     icon: SvgPicture.asset(
      //       ImageAssets.back_button,
      //       height: 24,
      //       width: 12,
      //     ),
      //     onPressed: () => Get.toNamed(Routes.HOME), // Navigate back using GetX
      //   ),
      //   title: const Text(
      //     'Back',
      //     style: TextStyle(
      //       color: AppColor.defaultColor,
      //       fontWeight: FontWeight.w500,
      //       fontSize: 16,
      //       fontFamily: 'Roboto',
      //     ),
      //   ),
      // ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: CustomBottomNavigationBar(),
      ),
    );
  }
}
