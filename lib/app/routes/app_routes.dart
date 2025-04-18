part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const ONBOARDING = _Paths.ONBOARDING;
  static const SPLASH = _Paths.SPLASH;
  static const LOGIN = _Paths.LOGIN;
  static const WELCOME = _Paths.WELCOME;
  static const FORGET_PASSWORD = _Paths.FORGET_PASSWORD;
  static const OTP = _Paths.OTP;
  static const RESET_PASSWORD = _Paths.RESET_PASSWORD;
  static const SIGN_UP = _Paths.SIGN_UP;
  static const DAILY_TASK = _Paths.DAILY_TASK;
  static const CATEGORY = _Paths.CATEGORY;
  static const AI = _Paths.AI;
  static const SETTINGS = _Paths.SETTINGS;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const ONBOARDING = '/onboarding';
  static const SPLASH = '/';
  static const LOGIN = '/login';
  static const WELCOME = '/welcome';
  static const FORGET_PASSWORD = '/forget-password';
  static const OTP = '/otp';
  static const RESET_PASSWORD = '/reset-password';
  static const SIGN_UP = '/sign-up';
  static const DAILY_TASK = '/daily-task';
  static const CATEGORY = '/category';
  static const AI = '/ai';
  static const SETTINGS = '/settings';
}
