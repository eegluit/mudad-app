import 'package:get/get.dart';

class InfoPageController extends GetxController{
  RxString title = "".obs;
  @override
  void onInit() {
    // TODO: implement onInit
    title.value = Get.arguments;
    super.onInit();
  }
}