import 'package:esortcli/app/res/colors/app_color.dart';
import 'package:esortcli/app/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackColor,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: CustomBottomNavigationBar(),
      ),
    );
  }
}
