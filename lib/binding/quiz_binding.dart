import 'package:get/get.dart';
import '../controller/quiz_controller.dart';

class QuizBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => QuizController(),
      fenix: true,
    );
  }
}
