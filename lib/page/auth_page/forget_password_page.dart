import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth_controller.dart';
import '../../widget/text_form_field_widget.dart';
import '../../widget/toast_view/showtoast.dart';
import 'otp_page.dart';

class ForgetPasswordPage extends StatelessWidget {
  static const route = '/forgetPasswordPage';
  static AuthController authController = Get.find<AuthController>();
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.only(
            left: 28,
            right: 28,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * 0.15,
              ),
              SizedBox(
                width: Get.width,
                child: Center(
                  child: Image.asset('images/mudad.png', height: 50),
                ),
              ),
              SizedBox(
                height: Get.height * 0.07,
              ),
              const Text(
                'Email',
                style: TextStyle(
                  color: Color(0xFF1F306B),
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextFormFieldWidget(
                controller: authController.emailController,
                hint: 'Enter your email',
                text: 'Enter your email',
                isEmail: true,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: Get.height * 0.30,
              ),
              // Flexible(child: Container()),
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
                      authController.emailController.text,
                    )) {
                      authController.isLoading(true);
                      authController.authService
                          .forgetPassword(
                        authController.emailController.text,
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
                          Get.toNamed(OtpPage.route,
                              arguments: [response.token, 'forget']);
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
                            'Forget Password',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validate(String email) {
    if (email.isEmpty) {
      Get.snackbar(
        'Error',
        "Please Enter Email",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
    return true;
  }
}
