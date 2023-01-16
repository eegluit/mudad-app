import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth_controller.dart';
import '../../widget/text_form_password_field.dart';
import '../../widget/toast_view/showtoast.dart';
import 'sign_in_page.dart';

class ResetPasswordPage extends StatelessWidget {
  static const route = '/resetPasswordPage';
  static AuthController authController = Get.find<AuthController>();
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    authController.passwordController.text = '';
    authController.confirmPasswordController.text = '';
    var showPassword = false.obs;
    var token = Get.arguments[0].toString();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          'Reset Password',
          style: TextStyle(
            color: Color(0xFF1F276B),
            fontSize: 32,
            fontWeight: FontWeight.w900,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF1F276B),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.only(left: 28, right: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * 0.20,
              ),
              const Text(
                'Password',
                style: TextStyle(
                  color: Color(0xFF1F306B),
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Obx(
                () => TextFormPasswordFieldWidget(
                  controller: authController.passwordController,
                  hint: 'Enter your password',
                  isPassword: !showPassword.value,
                  keyboardType: TextInputType.text,
                  text: 'Enter your password',
                  onSuffix: () {
                    showPassword.value = !showPassword.value;
                  },
                ),
              ),
              SizedBox(
                height: Get.height * 0.04,
              ),
              const Text(
                'Confirm Password',
                style: TextStyle(
                  color: Color(0xFF1F306B),
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Obx(
                () => TextFormPasswordFieldWidget(
                  controller: authController.confirmPasswordController,
                  hint: 'Re-type your password',
                  isPassword: !showPassword.value,
                  keyboardType: TextInputType.text,
                  text: 'Re-type your password',
                  onSuffix: () {
                    showPassword.value = !showPassword.value;
                  },
                ),
              ),
              SizedBox(
                height: Get.height * 0.10,
              ),
              SizedBox(
                width: Get.width,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13)),
                    ),
                  ),
                  onPressed: () {
                    if (validate(
                      authController.passwordController.text,
                      authController.confirmPasswordController.text,
                    )) {
                      authController.isLoading(true);
                      authController.authService
                          .resetPassword(
                        authController.passwordController.text,
                        token,
                      )
                          .then((response) {
                        authController.isLoading(false);
                        if (response.code != null) {
                          toastShow(error: true,massage: response.message);
                          // Get.snackbar('Error', '${response.message}',
                          //     snackPosition: SnackPosition.BOTTOM,
                          //     backgroundColor: Colors.red,
                          //     colorText: Colors.white);
                        } else {
                          toastShow(error: false,massage: response.message);
                          // Get.snackbar('Success', '${response.message}',
                          //     snackPosition: SnackPosition.BOTTOM,
                          //     backgroundColor: Colors.green.shade600,
                          //     colorText: Colors.white);
                          authController.passwordController.text = '';
                          authController.confirmPasswordController.text = '';
                          Get.toNamed(SignInPage.route);
                        }
                      });
                    }
                  },
                  child: Obx(
                    () => authController.isLoading.value
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Loading...',
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ],
                          )
                        : const Text(
                            'Reset Password',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validate(String password, String confirmPassword) {
    if (password.isEmpty) {
      Get.snackbar(
        'Error',
        "Please Enter Password",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    } else if (password.length < 8) {
      Get.snackbar(
        'Error',
        "Password must be at least 8 character",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    } else if (password != confirmPassword) {
      Get.snackbar(
        'Error',
        "Password is not match confirm password",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
    return true;
  }
}
