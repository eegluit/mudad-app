import 'package:get/get.dart';
import 'package:mudad/model/services/auth_service.dart';
import '../page/auth_page/sign_in_page.dart';
import '../page/home/home_page.dart';
import '../page/home/verification_view/verification_view.dart';
import '../../model/models/profile_model/get_user_profile.dart';

import 'home_controller.dart';

class SplashController extends GetxController {
  Rx<GetProfileModel> profileData = GetProfileModel().obs;
  //HomeController controller = Get.put(HomeController());

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      if (Get.find<AuthServices>().getUserToken() != "") {
        if (Get.find<AuthServices>().user.value.user?.isKyc == false) {
          Get.toNamed(VerificationScreen.route);
        } else {
          Get.offNamed(HomePage.route);
        }
      } else {
        Get.offNamed(SignInPage.route);
      }
    });
  }
}
