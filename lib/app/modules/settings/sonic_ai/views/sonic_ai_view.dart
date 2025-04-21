import 'package:esortcli/app/modules/settings/sonic_ai/views/upgrade_dialog.dart';
import 'package:esortcli/app/res/assests/image_assets.dart';
import 'package:esortcli/app/res/colors/app_color.dart';
import 'package:esortcli/app/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SonicAiView extends StatefulWidget {
  const SonicAiView({super.key});

  @override
  _SonicAiViewState createState() => _SonicAiViewState();
}

class _SonicAiViewState extends State<SonicAiView> {
  String _selectedPlan = 'Lifetime';

  Widget _buildPlanOption(
    String title,
    String price,
    bool isSelected,
    VoidCallback onTap, {
    bool isBestValue = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          isSelected
              ? SvgPicture.asset(ImageAssets.selected, height: 24, width: 24)
              : Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey, width: 2),
                ),
              ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter',
                  ),
                ),
                Text(
                  price,
                  style: const TextStyle(
                    color: AppColor.whiteTextColor,
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          if (isBestValue)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                'BEST VALUE',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(String feature) {
    return Row(
      children: [
        SvgPicture.asset(ImageAssets.light, height: 22, width: 22),
        const SizedBox(width: 10),
        Text(
          feature,
          style: const TextStyle(
            color: AppColor.whiteColor,
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(ImageAssets.background, fit: BoxFit.fill),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: SvgPicture.asset(
                          ImageAssets.back_button,
                          height: 24,
                          width: 12,
                          color: AppColor.whiteColor,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'SonicAI',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Inter',
                            ),
                          ),
                          const SizedBox(width: 5),
                          SvgPicture.asset(
                            ImageAssets.pro,
                            height: 24,
                            width: 12,
                          ),
                        ],
                      ),
                      const SizedBox(width: 5),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Try Sonic AI Premium Features',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: AppColor.transparentColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        _buildPlanOption(
                          'Monthly',
                          '\$7.99 /month',
                          _selectedPlan == 'Monthly',
                          () {
                            setState(() {
                              _selectedPlan = 'Monthly';
                            });
                          },
                        ),
                        const Divider(color: AppColor.dividerColor),
                        _buildPlanOption(
                          'Lifetime',
                          '\$250',
                          _selectedPlan == 'Lifetime',
                          () {
                            setState(() {
                              _selectedPlan = 'Lifetime';
                            });
                          },
                          isBestValue: true,
                        ),
                        const Divider(color: AppColor.dividerColor),
                        _buildPlanOption(
                          'Yearly',
                          '\$69.99 /year',
                          _selectedPlan == 'Yearly',
                          () {
                            setState(() {
                              _selectedPlan = 'Yearly';
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'WHAT\'S INCLUDED',
                    style: TextStyle(
                      color: Color(0xFFB0B0B0),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 15),
                  _buildFeatureItem('Some features goes here'),
                  const SizedBox(height: 15),
                  _buildFeatureItem('Some features goes here'),
                  const SizedBox(height: 15),
                  _buildFeatureItem('Some features goes here'),
                  const SizedBox(height: 15),
                  _buildFeatureItem('Some features goes here'),
                  const SizedBox(height: 15),
                  _buildFeatureItem('Some features goes here'),
                  const SizedBox(height: 15),
                  _buildFeatureItem('Some features goes here'),
                  const Spacer(),
                  RoundButton(
                    title: 'Free Trial',
                    buttonColor: AppColor.defaultColor,
                    textColor: AppColor.whiteColor,
                    radius: 10,
                    height: 50,
                    onPress: () {
                      Get.dialog(UpgradeDialog(onConfirm: () {}));
                    },
                  ),
                  const SizedBox(height: 10),
                  const Center(
                    child: Text(
                      '3 DAY FREE TRIAL, THEN \$19.99/YEAR. CANCEL ANYTIME.',
                      style: TextStyle(
                        color: Color(0xFFB0B0B0),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
