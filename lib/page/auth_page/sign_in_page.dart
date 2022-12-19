import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/auth_controller.dart';
import '../../widget/text_form_field_widget.dart';
import '../../widget/text_form_password_field.dart';
import 'forget_password_page.dart';
import 'otp_page.dart';
import 'sign_up_page.dart';

class SignInPage extends StatelessWidget {
  static const route = '/signInPage';
  static AuthController authController = Get.find<AuthController>();
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var showPassword = false.obs;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.only(left: 28, right: 28),
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
                height: Get.height * 0.04,
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
                height: Get.height * 0.015,
              ),
              InkWell(
                onTap: () {
                  authController.emailController.clear();
                  Get.toNamed(ForgetPasswordPage.route);
                },
                child: const Text(
                  'Forget Password?',
                  style: TextStyle(
                    color: Color(0xFF651F6B),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.05,
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
                      authController.emailController.text,
                      authController.passwordController.text,
                    )) {
                      authController.isLoading(true);
                      authController.authService
                          .login(
                        authController.emailController.text,
                        authController.passwordController.text,
                      )
                          .then((response) {
                        authController.isLoading(false);
                        if (response.code != null) {
                          Get.snackbar('Error', '${response.message}',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.red,
                              colorText: Colors.white);
                        } else {
                          Get.snackbar('Success', '${response.message}',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.green.shade600,
                              colorText: Colors.white);
                          Get.toNamed(OtpPage.route,
                              arguments: [response.tokens, 'login']);
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
                            'Login',
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
              SizedBox(
                width: Get.width,
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Don't have an account yet? Register ",
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      children: [
                        TextSpan(
                          text: 'here',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.offNamed(SignUpPage.route);
                            },
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                              color: Color(0xFF651F6B),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )
                      ],
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

  bool validate(String email, String password) {
    if (email.isEmpty) {
      Get.snackbar(
        'Error',
        "Please Enter Email",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    } else if (password.isEmpty) {
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
    }
    return true;
  }
}
