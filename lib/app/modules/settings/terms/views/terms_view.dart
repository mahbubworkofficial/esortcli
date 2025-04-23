import 'package:esortcli/app/res/assests/image_assets.dart';
import 'package:esortcli/app/res/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TermsView extends StatelessWidget {
  const TermsView({super.key});

  Widget _buildTerm(String number, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'Sora',
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            description,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'Sora',
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.blackColor,
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Trams &  Condition',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: AppColor.whiteColor,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'By using the Business Coach Chatbot, you agree to the following terms:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              // Terms list
              _buildTerm(
                '1.',
                'The chatbot provides general business guidance and advice but is not a substitute for professional consulting services.',
              ),
              const SizedBox(height: 15),
              _buildTerm(
                '2.',
                'We offer both free and paid subscription plans. Paid plans are billed on a recurring basis unless cancelled.',
              ),
              const SizedBox(height: 15),
              _buildTerm(
                '3.',
                'User data is handled securely and in accordance with our PRIVACY POLICY.',
              ),
              const SizedBox(height: 15),
              _buildTerm(
                '4.',
                'We are not responsible for decisions made based on the chatbot’s advice or any resulting outcomes.',
              ),
              const SizedBox(height: 15),
              _buildTerm(
                '5.',
                'Misuse of the service or violation of these terms may result in termination of access.',
              ),
              const SizedBox(height: 20),
              const Text(
                'By continuing to use the chatbot, you accept these terms. For questions, contact our support team.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Sora',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
