import 'package:get/get.dart';
import '../controller/personal_controller.dart';

class PersonalBinding extends Bindings {
  @override
  void dependencies() {
     Get.lazyPut(
      () => PersonalController(),
      fenix: true,
    );
  }
}