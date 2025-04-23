import 'package:esortcli/app/modules/settings/views/settings_pop_view.dart';
import 'package:esortcli/app/res/assests/image_assets.dart';
import 'package:esortcli/app/res/colors/app_color.dart';
import 'package:esortcli/app/routes/app_pages.dart';
import 'package:esortcli/app/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/settings_controller.dart';
import 'package:getwidget/getwidget.dart';

class SettingsView extends GetView<SettingsController> {
  SettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.blackColor,
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Settings',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 28,
                            color: AppColor.defaultColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Notification',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 24,
                                color: AppColor.whiteColor,
                              ),
                            ),
                            Container(
                              width: 50,
                              height: 45,
                              child: ClipRRect(
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    width: 55,
                                    height: 31,
                                    child: GFToggle(
                                      onChanged: (val) {},
                                      value: true,
                                      enabledThumbColor: AppColor.defaultColor,
                                      enabledTrackColor: Color(0xCC79A78D),
                                      type: GFToggleType.ios,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.SUBSCRIPTION);
                        },
                        child: Container(
                          height: 30,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Manage Subscription',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24,
                                  color: AppColor.whiteColor,
                                ),
                              ),
                              SvgPicture.asset(
                                ImageAssets.forward_arrow,
                                height: 35,
                                width: 35,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.PERSONAL_INFO);
                        },
                        child: Container(
                          height: 30,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Personal information',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24,
                                  color: AppColor.whiteColor,
                                ),
                              ),
                              SvgPicture.asset(
                                ImageAssets.forward_arrow,
                                height: 35,
                                width: 35,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.HELP);
                        },
                        child: Container(
                          height: 30,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Help & Support',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24,
                                  color: AppColor.whiteColor,
                                ),
                              ),
                              SvgPicture.asset(
                                ImageAssets.forward_arrow,
                                height: 35,
                                width: 35,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.TERMS);
                        },
                        child: Container(
                          height: 30,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Terms & Condition',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24,
                                  color: AppColor.whiteColor,
                                ),
                              ),
                              SvgPicture.asset(
                                ImageAssets.forward_arrow,
                                height: 35,
                                width: 35,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.PRIVACY);
                        },
                        child: Container(
                          height: 34,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Privacy Policy',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24,
                                  color: AppColor.whiteColor,
                                ),
                              ),
                              SvgPicture.asset(
                                ImageAssets.forward_arrow,
                                height: 35,
                                width: 35,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          Get.dialog(
                            SettingsPopView(
                              message:
                                  'Are you sure you want to delete all your\ndata?',
                              onConfirm: () {},
                            ),
                          );
                        },
                        child: Container(
                          height: 30,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Delete my Data',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24,
                                  color: AppColor.whiteColor,
                                ),
                              ),
                              SvgPicture.asset(
                                ImageAssets.delete_data,
                                height: 24,
                                width: 24,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          Get.dialog(
                            SettingsPopView(
                              message: 'Do you really want to log out?',
                              onConfirm: () {},
                            ),
                          );
                        },
                        child: Container(
                          height: 30,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Log Out',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24,
                                  color: AppColor.redTextColor,
                                ),
                              ),
                              InkWell(
                                child: SvgPicture.asset(
                                  ImageAssets.logout,
                                  height: 24,
                                  width: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CustomBottomNavigationBar(),
            ],
          ),
        ),
      ),
    );
  }
}
