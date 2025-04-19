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
  static const CATAGORY_LIST = _Paths.CATAGORY_LIST;
  static const TASK = _Paths.TASK;
  static const SUBSCRIPTION = _Paths.SETTINGS + _Paths.SUBSCRIPTION;
  static const PERSONAL_INFO = _Paths.SETTINGS + _Paths.PERSONAL_INFO;
  static const HELP = _Paths.SETTINGS + _Paths.HELP;
  static const TERMS = _Paths.SETTINGS + _Paths.TERMS;
  static const PRIVACY = _Paths.SETTINGS + _Paths.PRIVACY;
  static const EDIT_INFO =
      _Paths.SETTINGS + _Paths.PERSONAL_INFO + _Paths.EDIT_INFO;
  static const CHANGE_INFO =
      _Paths.SETTINGS + _Paths.PERSONAL_INFO + _Paths.CHANGE_INFO;
  static const CHANGE_PASS =
      _Paths.SETTINGS + _Paths.PERSONAL_INFO + _Paths.CHANGE_PASS;
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
  static const CATAGORY_LIST = '/catagory-list';
  static const TASK = '/task';
  static const SUBSCRIPTION = '/subscription';
  static const PERSONAL_INFO = '/personal-info';
  static const HELP = '/help';
  static const TERMS = '/terms';
  static const PRIVACY = '/privacy';
  static const EDIT_INFO = '/edit-info';
  static const CHANGE_INFO = '/change-info';
  static const CHANGE_PASS = '/change-pass';
}
