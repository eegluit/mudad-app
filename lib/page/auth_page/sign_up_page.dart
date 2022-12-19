import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/auth_controller.dart';
import '../../widget/text_form_field_widget.dart';
import '../../widget/text_form_password_field.dart';
import 'otp_page.dart';
import 'sign_in_page.dart';

class SignUpPage extends StatelessWidget {
  static const route = '/signUpPage';
  static AuthController authController = Get.find<AuthController>();
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var showPassword = false.obs;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.only(left: 28, right: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * 0.12,
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
                'Full Name',
                style: TextStyle(
                  color: Color(0xFF1F306B),
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextFormFieldWidget(
                controller: authController.fullNameController,
                hint: 'Your Name, e.g: John Doe',
                text: 'Your Name, e.g: John Doe',
                isEmail: true,
                keyboardType: TextInputType.name,
              ),
              SizedBox(
                height: Get.height * 0.04,
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
                hint: 'Your email, e.g: johndoe@gmail.com',
                text: 'Your email, e.g: johndoe@gmail.com',
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
                      authController.fullNameController.text,
                      authController.emailController.text,
                      authController.passwordController.text,
                      authController.confirmPasswordController.text,
                    )) {
                      authController.isLoading(true);
                      authController.authService
                          .signUp(
                        authController.fullNameController.text,
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
                              arguments: [response.tokens, 'signUp']);
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
                            'Register',
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
                    text: TextSpan(
                      text: "Already have an account? Sign In ",
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
                              Get.offNamed(SignInPage.route);
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
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validate(
      String name, String email, String password, String confirmPassword) {
    if (name.isEmpty) {
      Get.snackbar(
        'Error',
        "Please Enter Full Name",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    } else if (email.isEmpty) {
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
