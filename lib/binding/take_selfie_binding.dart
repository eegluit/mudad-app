import 'package:get/get.dart';
import '../controller/take_selfie_controller.dart';

class TakeSelfieBinding extends Bindings {
  @override
  void dependencies() {
     Get.lazyPut(
      () => TakeSelfieController(),
      fenix: true,
    );
  }
}