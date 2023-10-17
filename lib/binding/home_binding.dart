import 'package:get/get.dart';
import 'package:mudad/controller/add_a_card_controller/add_a_card_controller.dart';
import 'package:mudad/controller/profile_view_controller/edit_profile_controller.dart';
import 'package:mudad/controller/refer_friend_controller/refer_conttroller.dart';
import '../controller/home_controller.dart';
import '../controller/last_transaction_controller/info_page_controller.dart';
import '../controller/map_view_controller/map_view_controller.dart';
import '../controller/profile_view_controller/change_password_controller.dart';
import '../controller/last_transaction_controller/loan_replayment_controller.dart';
import '../controller/qr_code_controller/qr_code_controller.dart';
import '../controller/vendor_details_controller.dart';
import 'package:mudad/controller/add_a_card_controller/add_card_otp_controller.dart';
import '../controller/transaction_list_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(),
      fenix: true,
    );
    Get.lazyPut(
      () => ChangePasswordController(),
      fenix: true,
    );
    Get.lazyPut(
      () => EditProfileController(),
      fenix: true,
    );
    Get.lazyPut(
      () => AddCardController(),
      fenix: true,
    );
    Get.lazyPut(
      () => InfoPageController(),
      fenix: true,
    );
    Get.lazyPut(
      () => ReferController(),
      fenix: true,
    );
    Get.lazyPut(
      () => QrCodeController(),
      fenix: true,
    );
    Get.lazyPut(
      () => MapViewController(),
      fenix: true,
    );
    Get.lazyPut(
      () => VendorDetailsController(),
      fenix: true,
    );
    Get.lazyPut(
      () => AddCardOtpController(),
      fenix: true,
    );
    Get.lazyPut(() => LoanRepaymentController(), fenix: true);
    Get.lazyPut(() => TransactionListController(), fenix: true);
  }
}
