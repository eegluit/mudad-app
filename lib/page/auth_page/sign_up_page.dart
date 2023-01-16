import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/auth_controller.dart';
import '../../widget/text_field_view/common_textfield.dart';
import '../../widget/text_form_field_widget.dart';
import '../../widget/text_form_password_field.dart';
import '../../widget/toast_view/showtoast.dart';
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
          child: Form(
            key: authController.formSignKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Obx(
               () {
                return Column(
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
                    CommonTextField(
                      label: "Full Name",
                      controller: authController.fullNameController,
                      keyboardType: TextInputType.name,
                      hintText: "Your Name, e.g: John Doe".tr,
                      validator: (value) {
                        if (value!.isEmpty) {
                          authController.nameError.value = "Please enter your full name.".tr;
                          return "";
                        } else if (value.removeAllWhitespace == "") {
                          authController.nameError.value = "Please enter valid name.".tr;
                          return null;
                        } else {
                          authController.nameError.value = "";
                          return null;
                        }
                      },
                      errorText: authController.nameError.value,
                    ),
                     SizedBox(height: Get.height * 0.025,),
                    CommonTextField(
                      label: "Email",
                      controller: authController.emailController,
                      keyboardType: TextInputType.emailAddress,
                      hintText: 'Your email, e.g: johndoe@gmail.com'.tr,
                      validator: (value) {
                        if (value!.isEmpty) {
                          authController.emailError.value = "Please enter your email.".tr;
                          return "";
                        } else if (value.removeAllWhitespace == "") {
                          authController.emailError.value = "Please enter valid email.".tr;
                          return null;
                        } else {
                          authController.emailError.value = "";
                          return null;
                        }
                      },
                      errorText: authController.emailError.value,
                    ),
                    SizedBox(
                      height: Get.height * 0.025,
                    ),
                    CommonTextField(
                      label: "Password",
                      suffixIcon: true,
                      controller: authController.passwordController,
                      keyboardType: TextInputType.text,
                      hintText: "Enter your password.".tr,
                      validator: (value) {
                        if (value!.isEmpty) {
                          authController.passwordError.value = "Please enter your password.".tr;
                          return "";
                        } else if (value.removeAllWhitespace == "") {
                          authController.passwordError.value = "Please enter valid password.".tr;
                          return "";
                        } else {
                          authController.passwordError.value = "";
                          return null;
                        }
                      },
                      errorText: authController.passwordError.value,
                    ),
                    SizedBox(
                      height: Get.height * 0.025,
                    ),
                    CommonTextField(
                      label: "Confirm Password",
                      suffixIcon: true,
                      controller: authController.confirmPasswordController,
                      keyboardType: TextInputType.text,
                      hintText: 'Re-type your password'.tr,
                      validator: (value) {
                        if (value!.isEmpty) {
                          authController.rePasswordError.value = "Please enter your password.".tr;
                          return "";
                        } else if (value != authController.passwordController.text) {
                          authController.rePasswordError.value = "Password is not same.".tr;
                          return "";
                        } else {
                          authController.rePasswordError.value = "";
                          return null;
                        }
                      },
                      errorText: authController.rePasswordError.value,
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
                          if (authController.formSignKey.currentState?.validate()??false) {
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
                );
              }
            ),
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
