import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controller/home_controller.dart';
import '../home/home_page.dart';

class CreditCompleteScorePage extends StatelessWidget {
  static const route = '/creditCompletePage';
  static HomeController homeController = Get.find<HomeController>();
  const CreditCompleteScorePage({Key? key}) : super(key: key);

  void initState() {
    homeController.creditService
        .getCreditScore(homeController.getToken)
        .then((response) {
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
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    initState();
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
            'Credit Score Calculation Complete',
            style: TextStyle(
              color: Color(0xFF651F6B),
              fontSize: 32,
              fontWeight: FontWeight.w900,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: Get.height * 0.15,
          ),
          SvgPicture.asset('images/check.svg'),
          SizedBox(
            height: Get.height * 0.15,
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
                Get.offAllNamed(HomePage.route);
              },
              child: const Text(
                'Go to Dashboard',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
