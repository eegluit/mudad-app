import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import '../../model/utils/resource/color_resource.dart';
import '../../controller/add_a_card_controller/add_card_otp_controller.dart';
import 'package:mudad/widget/button_view/common_button.dart';

class AddCardOtpPage extends GetView<AddCardOtpController> {
  static const route = '/addCardOtpPage';
  static AddCardOtpController otpController = Get.find<AddCardOtpController>();
  const AddCardOtpPage({Key? key}) : super(key: key);

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
              'Card Verification',
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
              'Please enter the OTP sent to your mobile number.',
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
            CommonButton(
                text: "Save Card",
                loading: controller.isLoading.value,
                onPressed: () {
                  if (validate(controller.otpController.text)) {
                    controller.isLoading.value = true;
                    controller.cardService
                        .verifyOtpForUser(
                            controller.otpController.text, controller.userID)
                        .then((value) {
                      controller.isLoading.value = false;
                      print("ABCD ${value.errorMessage}");
                    });
                  }
                },
                color: ColorResource.mainColor),
            // Container(
            //   padding: const EdgeInsets.only(
            //     left: 28,
            //     right: 28,
            //   ),
            //   width: Get.width,
            //   height: 50,
            //   child: ElevatedButton(
            //     style: ButtonStyle(
            //       shape: MaterialStateProperty.all(
            //         RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(13)),
            //       ),
            //     ),
            //     onPressed: () {
            //       if (validate(controller.otpController.text)) {
            //         controller.cardService
            //             .verifyOtpForUser(
            //                 controller.otpController.text, controller.userID)
            //             .then((value) {
            //           print("ABCD ${value.errorMessage}");
            //         });
            //       }
            //     },
            //     child: Obx(
            //       () => otpController.isLoading.value
            //           ? const Row(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 Text(
            //                   'Loading...',
            //                   style: TextStyle(fontSize: 20),
            //                 ),
            //                 SizedBox(
            //                   width: 10,
            //                 ),
            //                 CircularProgressIndicator(
            //                   color: Colors.white,
            //                 ),
            //               ],
            //             )
            //           : const Text(
            //               'Submit',
            //               style: TextStyle(
            //                 fontSize: 18,
            //                 fontWeight: FontWeight.w700,
            //               ),
            //             ),
            //     ),
            //   ),
            // ),
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
