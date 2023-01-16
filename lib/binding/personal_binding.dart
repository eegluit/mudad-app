import 'package:get/get.dart';
import 'package:mudad/controller/pending_payment_controller.dart';
import '../controller/personal_controller.dart';

class PersonalBinding extends Bindings {
  @override
  void dependencies() {
     Get.lazyPut(
      () => PersonalController(),
      fenix: true,
    );
     Get.lazyPut(
           () => PendingPaymentController(),
       fenix: true,
     );
  }
}