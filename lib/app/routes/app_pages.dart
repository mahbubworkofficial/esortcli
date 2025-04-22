import 'package:get/get.dart';

import '../modules/ai/views/ai_view.dart';
import '../modules/catagory_list/views/catagory_list_view.dart';
import '../modules/category/views/category_view.dart';
import '../modules/forget_password/views/forget_password_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/views/login_view.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/otp/views/otp_view.dart';
import '../modules/reset_password/views/reset_password_view.dart';
import '../modules/settings/help/views/help_view.dart';
import '../modules/settings/personal_info/change_info/views/change_info_view.dart';
import '../modules/settings/personal_info/change_pass/views/change_pass_view.dart';
import '../modules/settings/personal_info/views/personal_info_view.dart';
import '../modules/settings/privacy/views/privacy_view.dart';
import '../modules/settings/sonic_ai/views/sonic_ai_view.dart';
import '../modules/settings/subscription/views/subscription_view.dart';
import '../modules/settings/terms/views/terms_view.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/sign_up/views/sign_up_view.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/task/views/task_view.dart';
import '../modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(name: _Paths.ONBOARDING, page: () => const OnboardingView()),
    GetPage(name: _Paths.SPLASH, page: () => const SplashScreen()),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.FORGET_PASSWORD,
      page: () => ForgetPasswordView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => OtpView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => ResetPasswordView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.CATEGORY,
      page: () => CategoryView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.AI,
      page: () => AiView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
      transition: Transition.rightToLeft,
      children: [
        GetPage(
          name: _Paths.SUBSCRIPTION,
          page: () => SubscriptionView(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: _Paths.PERSONAL_INFO,
          page: () => PersonalInfoView(),
          transition: Transition.rightToLeft,
          children: [
            GetPage(
              name: _Paths.CHANGE_INFO,
              page: () => ChangeInfoView(),
              transition: Transition.rightToLeft,
            ),
            GetPage(
              name: _Paths.CHANGE_PASS,
              page: () => ChangePassView(),
              transition: Transition.rightToLeft,
            ),
          ],
        ),
        GetPage(
          name: _Paths.HELP,
          page: () => HelpView(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: _Paths.TERMS,
          page: () => const TermsView(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: _Paths.PRIVACY,
          page: () => const PrivacyView(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: _Paths.SONIC_AI,
          page: () => SonicAiView(),
          transition: Transition.rightToLeft,
        ),
      ],
    ),
    GetPage(
      name: _Paths.CATAGORY_LIST,
      page: () => CatagoryListView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.TASK,
      page: () => TaskView(),
      transition: Transition.rightToLeft,
    ),
  ];
}
