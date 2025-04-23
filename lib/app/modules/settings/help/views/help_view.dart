import 'package:esortcli/app/modules/settings/help/controllers/help_controller.dart';
import 'package:esortcli/app/modules/settings/help/views/send_dialog.dart';
import 'package:esortcli/app/res/assests/image_assets.dart';
import 'package:esortcli/app/res/colors/app_color.dart';
import 'package:esortcli/app/widgets/input_text_widget.dart';
import 'package:esortcli/app/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HelpView extends GetView<HelpController> {
  HelpView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.blackColor,
        body: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          ImageAssets.back_button,
                          height: 24,
                          width: 12,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Back',
                          style: TextStyle(
                            color: AppColor.defaultColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Help & Support',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                        color: AppColor.whiteColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Describe Your Problem',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      InputTextWidget(
                        borderRadius: 20,
                        height: 250,
                        maxLines: 10,
                        onChanged: (value) {
                          // controller.email.value = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!GetUtils.isEmail(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  RoundButton(
                    title: "Send",
                    onPress: () {
                      Get.dialog(SendDialog(onConfirm: () {}));
                    },
                    buttonColor: AppColor.defaultColor,
                    textColor: AppColor.whiteColor,
                    height: 53,
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    radius: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
