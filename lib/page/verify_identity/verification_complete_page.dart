import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'verification_cancel_page.dart';

class VerificationCompletePage extends StatelessWidget {
  static const route = '/verificationCompletePage';
  const VerificationCompletePage({Key? key}) : super(key: key);

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
          SvgPicture.asset('images/progress4.svg'),
          SizedBox(
            height: Get.height * 0.05,
          ),
          const Text(
            'Verification Process Complete',
            style: TextStyle(
              color: Color(0xFF651F6B),
              fontSize: 32,
              fontWeight: FontWeight.w900,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: Get.height * 0.05,
          ),
          SvgPicture.asset('images/check.svg'),
          SizedBox(
            height: Get.height * 0.10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 40, right: 40),
            child: Text(
              'If you want to purchase items using your credit, we will need some additional information to calcualte your credit score.',
              style: TextStyle(
                color: Color(0xFF32407B),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.10,
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
                Get.toNamed(VerificationCancelPage.route);
              },
              child: const Text(
                'Calculate Credit Store',
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
