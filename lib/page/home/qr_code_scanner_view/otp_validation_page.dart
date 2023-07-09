import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mudad/controller/otp_controller.dart';
import 'package:mudad/page/home/qr_code_scanner_view/payment_success_page.dart';
import 'package:mudad/utils/utils/resource/color_resource.dart';
import 'package:pinput/pinput.dart';

class OtpValidationPage extends GetView<OtpController> {
  static const route = '/otpValidationPage';
  static OtpController otpController = Get.find<OtpController>();
 // static HomeController homeController = Get.find<HomeController>();
  const OtpValidationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            const Text(
              'Please enter the OTP',
              style: TextStyle(
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
                    Get.toNamed(PaymentSuccessPage.route);
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
