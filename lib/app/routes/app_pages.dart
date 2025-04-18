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
import '../modules/settings/views/settings_view.dart';
import '../modules/sign_up/views/sign_up_view.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
    ),
    GetPage(
      name: _Paths.FORGET_PASSWORD,
      page: () => ForgetPasswordView(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => OtpView(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => ResetPasswordView(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
    ),
    GetPage(
      name: _Paths.CATEGORY,
      page: () => CategoryView(),
    ),
    GetPage(
      name: _Paths.AI,
      page: () => AiView(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
    ),
    GetPage(
      name: _Paths.CATAGORY_LIST,
      page: () => const CatagoryListView(),
    ),
  ];
}
