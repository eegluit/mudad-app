import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_document_reader_api/document_reader.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mudad/controller/otp_controller.dart';
import '../../controller/auth_controller.dart';
import '../../widget/text_field_view/common_textfield.dart';
import '../../widget/text_form_field_widget.dart';
import '../../widget/text_form_password_field.dart';
import 'package:mudad/utils/utils/resource/color_resource.dart';
import '../../widget/toast_view/showtoast.dart';
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
                  child: Image.asset('images/mudad.png', height: 100),
                ),
              ),
              SizedBox(
                height: Get.height * 0.07,
              ),
              _buildEmailPasswordRow(context, authController),
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
                    color: ColorResource.mainColor,
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
                    if (authController.formKey.currentState?.validate() ??
                        false) {
                      authController.isLoading(true);
                      authController.authService
                          .login(
                        authController.emailController.text,
                        authController.passwordController.text,
                      )
                          .then((response) {
                        authController.isLoading(false);
                        if (response.code != 200) {
                          toastShow(error: true, massage: response.message);
                          // Get.snackbar('Error', '${response.message}',
                          //     snackPosition: SnackPosition.BOTTOM,
                          //     backgroundColor: Colors.red,
                          //     colorText: Colors.white);
                        } else {
                          toastShow(error: false, massage: response.message);
                          // Get.snackbar('Success', '${response.message}',
                          //     snackPosition: SnackPosition.BOTTOM,
                          //     backgroundColor: Colors.green.shade600,
                          //     colorText: Colors.white);
                          Get.toNamed(OtpPage.route, arguments: [
                            response.tokens,
                            'login',
                            authController.emailController.text
                          ]);
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
                              color: ColorResource.mainColor,
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

  Widget _buildEmailPasswordRow(
      BuildContext context, AuthController controller) {
    return Form(
      key: controller.formKey,
      child: Obx(() => Column(
            children: [
              CommonTextField(
                label: "Email",
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                hintText: "Enter your email address.".tr,
                validator: (value) {
                  if (value!.isEmpty) {
                    controller.emailError.value = "Please enter your email.".tr;
                    return "";
                  } else if (value.removeAllWhitespace == "") {
                    controller.emailError.value =
                        "Please enter valid email.".tr;
                    return null;
                  } else {
                    controller.emailError.value = "";
                    return null;
                  }
                },
                errorText: controller.emailError.value,
              ),
              const SizedBox(
                height: 30,
              ),
              CommonTextField(
                label: "Password",
                suffixIcon: true,
                controller: controller.passwordController,
                keyboardType: TextInputType.text,
                hintText: "Enter your password.".tr,
                validator: (value) {
                  if (value!.isEmpty) {
                    controller.passwordError.value =
                        "Please enter your password.".tr;
                    return "";
                  } else if (value.removeAllWhitespace == "") {
                    controller.passwordError.value =
                        "Please enter valid password.".tr;
                    return "";
                  } else {
                    controller.passwordError.value = "";
                    return null;
                  }
                },
                errorText: controller.passwordError.value,
              ),
            ],
          )),
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
