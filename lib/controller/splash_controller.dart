import 'package:get/get.dart';
import 'package:mudad/model/services/auth_service.dart';
import '../page/auth_page/sign_in_page.dart';
import '../page/home/home_page.dart';
import 'home_controller.dart';

class SplashController extends GetxController {
  //HomeController controller = Get.put(HomeController());

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3)).then((value) {

      if (Get.find<AuthService>().getUserToken() != "") {
        Get.offNamed(HomePage.route);
      } else {
        Get.offNamed(SignInPage.route);
      }
    });
  }
}
