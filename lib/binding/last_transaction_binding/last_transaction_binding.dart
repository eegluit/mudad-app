import 'package:get/get.dart';
import 'package:mudad/controller/last_transaction_controller/last_transaction_controller.dart';

class LastTransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
          () => LastTransactionController(),
      fenix: true,
    );
  }
}