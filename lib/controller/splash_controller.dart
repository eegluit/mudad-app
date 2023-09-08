import 'package:get/get.dart';
import 'package:mudad/model/services/auth_service.dart';
import 'package:mudad/page/verify_identity/verification_pending_page.dart';
import '../page/auth_page/sign_in_page.dart';
import '../page/home/home_page.dart';
import '../page/home/verification_view/verification_view.dart';
import '../../model/models/profile_model/get_user_profile.dart';

import 'home_controller.dart';
import '../../model/provider/home_provider.dart';
import '../../model/network_calls/dio_client/get_it_instance.dart';
import 'package:local_auth/local_auth.dart';

class SplashController extends GetxController {
  HomeProvider homeProvider = getIt();
  Rx<GetProfileModel> profileData = GetProfileModel().obs;
  //HomeController controller = Get.put(HomeController());

  @override
  void onInit() {
    super.onInit();
    getDashboardProfileData();
    authenticate();
  }

  Future renderScreenAfterLaunch() async {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      if (Get.find<AuthServices>().getUserToken() != "") {
        if (Get.find<AuthServices>().user.value.isKyc == false) {
          Get.toNamed(VerificationScreen.route);
        } else {
          if (Get.find<AuthServices>().user.value.status == 'pending') {
            Get.offNamed(VerificationPendingPage.route);
          } else {
            Get.offNamed(HomePage.route);
          }
        }
      } else {
        Get.offNamed(SignInPage.route);
      }
    });
  }

  Future getDashboardProfileData() async {
    var token = Get.find<AuthServices>().getUserToken();
    if (token == "") {
      return;
    }
    homeProvider.homeRepo.getDashboardUserDetails(token).then((response) async {
      print("ABCD ${response.toJson()}");
      if (response.code == 200) {
        try {
          await Get.find<AuthServices>().saveUser(response.user!.toJson());
          print("ABCD data saved}");
        } catch (e) {
          rethrow;
        }
      }
    });
  }

  Future<void> authenticate() async {
    final localAuth = LocalAuthentication();
    try {
      // Check if biometrics or pin/pattern/password authentication is available
      bool canCheckBiometrics = await localAuth.canCheckBiometrics;
      List<BiometricType> availableBiometrics =
          await localAuth.getAvailableBiometrics();
      if (canCheckBiometrics && availableBiometrics.isNotEmpty) {
        // Authenticate using biometrics (e.g., fingerprint, face recognition)
        bool isAuthenticated = await localAuth.authenticate(
          localizedReason:
              'Authenticate to access the application', // Reason shown to the user
          // useErrorDialogs: true, // Show system dialog on error (e.g., too many attempts)
          // stickyAuth: true, // Keep the authentication screen open until the user cancels
        );

        if (isAuthenticated) {
          renderScreenAfterLaunch();
          // Authentication successful, proceed to your app's main functionality
          // Navigate to the main screen or perform other actions.
        } else {
          // Authentication failed
        }
      } else {
        renderScreenAfterLaunch();
        // Biometrics are not available, prompt for pin/pattern/password
        // You can implement your own custom authentication UI here
        // or use a package like 'pin_code_fields' to handle this.
      }
    } catch (e) {
      // Handle errors
      print('ABCD Error during authentication: $e');
    }
  }
}
