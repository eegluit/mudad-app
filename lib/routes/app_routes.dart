import 'package:get/get.dart';
import '../binding/auth_binding.dart';
import '../binding/home_binding.dart';
import '../binding/otp_binding.dart';
import '../binding/personal_binding.dart';
import '../binding/quiz_binding.dart';
import '../page/verify_identity/select_id_type_page.dart';
import '../page/verify_identity/take_selfie.dart';
import '../page/verify_identity/verification_cancel_page.dart';
import '../page/verify_identity/verification_complete_page.dart';
import '../page/verify_identity/verify_identity_page.dart';

class AppRoutes {
  AppRoutes._();

  static const initial = SplashPage.route;

  static final routes = [
    GetPage(
      name: SplashPage.route,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: SignInPage.route,
      page: () => const SignInPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: OtpPage.route,
      page: () => const OtpPage(),
      bindings: [OtpBinding(), HomeBinding()],
    ),
    GetPage(
      name: SignUpPage.route,
      page: () => const SignUpPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: TakeSelfiePage.route,
      page: () => const TakeSelfiePage(),
      binding: TakeSelfieBinding(),
    ),
    GetPage(
      name: NotificationPage.route,
      page: () => const NotificationPage(),
    ),
    GetPage(
      name: Transactionpage.route,
      page: () => const Transactionpage(),
    ),
    GetPage(
      name: PendingPaymentPage.route,
      page: () => const PendingPaymentPage(),
    ),
  ];
}
