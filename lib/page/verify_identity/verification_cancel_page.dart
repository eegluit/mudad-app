import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mudad/utils/utils/resource/color_resource.dart';


class VerificationCancelPage extends StatelessWidget {
  static const route = '/verificationCancelPage';
  const VerificationCancelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: Get.height * 0.04,
          ),
          SvgPicture.asset('images/progress3.svg'),
          SizedBox(
            height: Get.height * 0.05,
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 40,
              right: 40,
            ),
            child: Text(
              'Verification Process Failed',
              style: TextStyle(
                color: ColorResource.mainColor,
                fontSize: 32,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: Get.height * 0.10,
          ),
          SvgPicture.asset('images/cross_red.svg'),
          SizedBox(
            height: Get.height * 0.10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 45, right: 45),
            child: Text(
              'We couldnt capture your face. Watch out for poor lighting and blur',
              style: TextStyle(
                color: Color(0xFF32407B),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.05,
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
              },
              child: const Text(
                'Try again',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'skip for now',
            style: TextStyle(
              color: Color(0xFF1F276B),
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
