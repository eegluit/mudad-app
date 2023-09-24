import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mudad/model/services/auth_service.dart';
import 'package:pinput/pinput.dart';
import '../../controller/home_controller.dart';
import '../../model/utils/resource/color_resource.dart';
import '../../controller/otp_controller.dart';
import '../../widget/toast_view/showtoast.dart';
import '../home/home_page.dart';
import '../home/verification_view/verification_view.dart';
import 'reset_password_page.dart';

class OtpPage extends GetView<OtpController> {
  static const route = '/otpPage';
  static OtpController otpController = Get.find<OtpController>();
  // static HomeController homeController = Get.find<HomeController>();
  const OtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var token = Get.arguments[0].toString();
    var screenName = Get.arguments[1].toString();
    var email = Get.arguments[2]?.toString();
    final defaultPinTheme = PinTheme(
      width: 58,
      height: 58,
      textStyle: const TextStyle(
        fontSize: 18,
        color: Color(0xff000000),
        fontWeight: FontWeight.w500,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: ColorResource.mainColor,
          width: 3,
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.close,
              color: Color(0xFF1F276B),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'OTP Verification',
              style: TextStyle(
                color: Color(0xff000000),
                fontSize: 32,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              'Please enter the OTP sent to $email',
              style: const TextStyle(
                color: ColorResource.mainColor,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 58,
            ),
            Pinput(
              defaultPinTheme: defaultPinTheme,
              // validator: (s) {
              //   return s == '1234' ? null : 'Pin is incorrect';
              // },
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              onCompleted: (pin) {
                debugPrint(pin);
                otpController.otpController.text = pin;
              },
            ),
            const SizedBox(
              height: 35,
            ),
            Obx(
              () => Text(
                '00:${otpController.timeCount.value} Sec',
                style: const TextStyle(
                  color: Color(0xFF464646),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 21,
            ),
            SizedBox(
              width: Get.width,
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Didnt recieve a code? ",
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    children: [
                      TextSpan(
                        text: 'Resend',
                        recognizer: TapGestureRecognizer()..onTap = () {},
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
            const SizedBox(
              height: 46,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 28,
                right: 28,
              ),
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
                  if (validate(otpController.otpController.text)) {
                    otpController.isLoading(true);
                    if (screenName == 'forget') {
                      otpController.authService
                          .otpVerifyForget(
                        otpController.otpController.text,
                        token,
                      )
                          .then((response) {
                        otpController.isLoading(false);
                        if (response.code != null) {
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
                          Get.offAllNamed(ResetPasswordPage.route,
                              arguments: [response.token]);
                          // Get.delete<OtpController>();
                        }
                      });
                    } else {
                      otpController.authService
                          .otpVerify(
                        otpController.otpController.text,
                        token,
                      )
                          .then((response) async {
                        otpController.isLoading(false);
                        if (response.code != null) {
                          print("error : ${response.message}");
                          toastShow(error: true, massage: response.message);
                          // Get.snackbar('Error', '${response.message}',
                          //     snackPosition: SnackPosition.BOTTOM,
                          //     backgroundColor: Colors.red,
                          //     colorText: Colors.white);
                        } else {
                          await Get.find<AuthServices>().saveUserToken(
                              response.token?.access?.token ?? "",
                              response.user?.id ?? "");
                          await Get.find<AuthServices>()
                              .saveUser(response.user!.toJson());
                          if (response.user?.isKyc == true) {
                            if (response.user?.status == 'pending') {
                              Get.offAllNamed(VerificationScreen.route);
                            } else {
                              Get.offAllNamed(HomePage.route, arguments: [
                                response,
                                response.token!.access!.token!
                              ]);
                            }
                          } else {
                            Get.offAllNamed(VerificationScreen.route);
                          }
                          // Get.snackbar('Success', 'Successfully $screenName',
                          //     snackPosition: SnackPosition.BOTTOM,
                          //     backgroundColor: Colors.green.shade600,
                          //     colorText: Colors.white);
                          // print("success : ${response.message}");
                          // toastShow(error: false,massage: response.message);
                        }
                      });
                    }
                  }
                },
                child: Obx(
                  () => otpController.isLoading.value
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
                          'Submit',
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
    );
  }

  bool validate(String otp) {
    if (otp.isEmpty) {
      Get.snackbar(
        'Error',
        "Please Enter OTP",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
    return true;
  }
}
