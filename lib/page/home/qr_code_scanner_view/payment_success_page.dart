import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mudad/page/home/home_page.dart';
import 'package:mudad/utils/utils/resource/color_resource.dart';

class PaymentSuccessPage extends StatelessWidget {
  static const route = '/paymentSuccessPage';
  const PaymentSuccessPage({Key? key}) : super(key: key);

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
          SizedBox(
            height: Get.height * 0.05,
          ),
          const Text(
            'Payment Successful',
            style: TextStyle(
              color: ColorResource.mainColor,
              fontSize: 32,
              fontWeight: FontWeight.w900,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: Get.height * 0.05,
          ),
          Image.asset('images/check.png'),
          SizedBox(
            height: Get.height * 0.10,
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
                Get.toNamed(HomePage.route);
              },
              child: const Text(
                'Okay',
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
        ],
      ),
    );
  }
}
