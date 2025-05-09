import 'package:esortcli/app/widgets/input_text_widget.dart';
import 'package:esortcli/app/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../res/assests/image_assets.dart';
import '../res/colors/app_color.dart';

class AiDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const AiDialog({Key? key, required this.onConfirm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: AppColor.blackColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: SvgPicture.asset(
                  ImageAssets.cross,
                  height: 24,
                  width: 24,
                  color: AppColor.defaultColor,
                ),
                onPressed: () => Get.back(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  InputTextWidget(
                    hintText: 'Need',
                    onChanged: (value) {},
                    height: 90,
                    maxLines: 10,
                    borderColor: AppColor.defaultOpacity2Color,
                    backgroundColor: AppColor.backgroundColor,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: RoundButton(
                          title: 'Yes',
                          onPress: () => Get.back(),
                          height: 45,
                          radius: 10,
                          buttonColor: AppColor.defaultColor,
                          textColor: AppColor.whiteColor,
                          fontFamily: "Roboto",
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          width: 140,
                        ),
                      ),
                      const SizedBox(width: 18),
                      Flexible(
                        child: RoundButton(
                          title: 'No',
                          onPress: () => Get.back(),
                          height: 45,
                          radius: 10,
                          buttonColor: AppColor.defaultColor,
                          textColor: AppColor.whiteColor,
                          fontFamily: "Roboto",
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          width: 140,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
