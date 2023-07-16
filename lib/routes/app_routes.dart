import 'package:get/get.dart';
import 'package:mudad/binding/last_transaction_binding/last_transaction_binding.dart';
import 'package:mudad/controller/add_a_card_controller/add_a_card_controller.dart';
import 'package:mudad/page/home/qr_code_scanner_view/otp_validation_page.dart';
import 'package:mudad/page/home/qr_code_scanner_view/pay_merchant.dart';
import 'package:mudad/page/add_card/add_a_card.dart';
import 'package:mudad/page/home/change_password_view/change_password_screen.dart';
import 'package:mudad/page/home/edit_profile_view/edit_profile_screen.dart';
import 'package:mudad/page/home/info_page/info_page_view.dart';
import 'package:mudad/page/home/qr_code_scanner_view/payment_success_page.dart';
import 'package:mudad/page/home/qr_code_scanner_view/qr_code_scanner.dart';
import 'package:mudad/page/last_transaction_view/last_transaction_view.dart';
import 'package:mudad/page/top_offers_view/refer_a_friend_view.dart';
import '../binding/auth_binding.dart';
import '../binding/home_binding.dart';
import '../binding/otp_binding.dart';
import '../binding/personal_binding.dart';
import '../binding/quiz_binding.dart';
import '../binding/splash_binding.dart';
import '../binding/take_selfie_binding.dart';
import '../page/auth_page/forget_password_page.dart';
import '../page/auth_page/otp_page.dart';
import '../page/auth_page/reset_password_page.dart';
import '../page/auth_page/sign_in_page.dart';
import '../page/auth_page/sign_up_page.dart';
import '../page/available_merchant/available_merchant_view.dart';
import '../page/creditScore/bank_statement.dart';
import '../page/creditScore/credit_complete.dart';
import '../page/creditScore/credit_score.dart';
import '../page/creditScore/mala_credit_report_page.dart';
import '../page/creditScore/personal_info.dart';
import '../page/creditScore/quiz_page.dart';
import '../page/home/home_page.dart';
import '../page/home/vendor_map_location/vendor_map_location.dart';
import '../page/home/verification_view/verification_view.dart';
import '../page/notification_page.dart';
import '../page/pending_payment_page.dart';
import '../page/splash_page.dart';
import '../page/top_offers_view/top_offers_view.dart';
import '../page/transaction_page.dart';
import '../page/verify_identity/select_id_type_page.dart';
import '../page/verify_identity/take_selfie.dart';
import '../page/verify_identity/verification_cancel_page.dart';
import '../page/verify_identity/verification_complete_page.dart';
import '../page/verify_identity/verify_identity_page.dart';

class AppRoutes {
  AppRoutes._();

  static const initial = SplashPage.route;
  //static const initial = LastTransactionScreen.route;

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
      name: OtpValidationPage.route,
      page: () => const OtpValidationPage(),
      binding: OtpBinding()
    ),
    GetPage(
      name: SignUpPage.route,
      page: () => const SignUpPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: ForgetPasswordPage.route,
      page: () => const ForgetPasswordPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: ResetPasswordPage.route,
      page: () => const ResetPasswordPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: HomePage.route,
      page: () =>  HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: CreditScorePage.route,
      page: () => const CreditScorePage(),
    ),
    GetPage(
      name: PersonalInfoPage.route,
      page: () => const PersonalInfoPage(),
      bindings: [PersonalBinding(), HomeBinding()],
    ),
    GetPage(
      name: BankStatementPage.route,
      page: () => const BankStatementPage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: MalaCreditReportPage.route,
      page: () => const MalaCreditReportPage(),
    ),
    GetPage(
      name: QuizPage.route,
      page: () => const QuizPage(),
      bindings: [QuizBinding(), HomeBinding()],
    ),
    GetPage(
      name: CreditCompleteScorePage.route,
      page: () => const CreditCompleteScorePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: VerificationScreen.route,
      page: () =>  VerificationScreen(),
      binding: TakeSelfieBinding(),
    ),
    GetPage(
      name: SelectIdTypePage.route,
      page: () => const SelectIdTypePage(),
      binding: TakeSelfieBinding(),
    ),
    GetPage(
      name: VerificationCancelPage.route,
      page: () => const VerificationCancelPage(),
    ),
    GetPage(
      name: VerificationCompletePage.route,
      page: () => const VerificationCompletePage(),
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
      binding: PersonalBinding()
    ),
    GetPage(
      name: AvailableMerchantScreen.route,
      page: () => const AvailableMerchantScreen(),
      binding: HomeBinding()
    ),
    GetPage(
      name: TopOffersScreen.route,
      page: () => const TopOffersScreen(),
      binding: HomeBinding()
    ),
    GetPage(
      name: ChangePasswordScreen.route,
      page: () => const ChangePasswordScreen(),
      binding: HomeBinding()
    ),
    GetPage(
      name: EditProfileScreen.route,
      page: () => const EditProfileScreen(),
      binding: HomeBinding()
    ),
    GetPage(
      name: LastTransactionScreen.route,
      page: () => const LastTransactionScreen(),
      binding: LastTransactionBinding()
    ),
    GetPage(
      name: AddCardScreen.route,
      page: () => const AddCardScreen(),
      binding: HomeBinding()
    ),
    GetPage(
      name: PayMerchantScreen.route,
      page: () => const PayMerchantScreen(),
      binding: HomeBinding()
    ),
    GetPage(
      name: PaymentSuccessPage.route,
      page: () => const PaymentSuccessPage(),
      binding: HomeBinding()
    ),
    GetPage(
      name: InfoPageViewScreen.route,
      page: () => const InfoPageViewScreen(),
      binding: HomeBinding()
    ),
    GetPage(
      name: ReferViewScreen.route,
      page: () => const ReferViewScreen(),
      binding: HomeBinding()
    ),
    GetPage(
      name: QrViewScreen.route,
      page: () => const QrViewScreen(),
      binding: HomeBinding()
    ),
    GetPage(
      name: VendorMapLocation.route,
      page: () => const VendorMapLocation(),
      binding: HomeBinding()
    ),
  ];
}
