import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controller/home_controller.dart';
import '../../widget/toast_view/showtoast.dart';
import '../home/home_page.dart';
import '../../model/utils/resource/color_resource.dart';

class CreditCompleteScorePage extends StatelessWidget {
  static const route = '/creditCompletePage';
  static HomeController homeController = Get.find<HomeController>();
  const CreditCompleteScorePage({Key? key}) : super(key: key);

  void initState() {
    homeController.creditService
        .getCreditScore(homeController.getToken)
        .then((response) {
      if (response.code != null) {
        // toastShow(error: true,massage: response.message);
        // Get.snackbar('Error', '${response.message}',
        //     snackPosition: SnackPosition.BOTTOM,
        //     backgroundColor: Colors.red,
        //     colorText: Colors.white);
      } else {
        // toastShow(error: false,massage: response.message);
        // Get.snackbar('Success', '${response.message}',
        //     snackPosition: SnackPosition.BOTTOM,
        //     backgroundColor: Colors.green.shade600,
        //     colorText: Colors.white);
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
          Image.asset('images/progress4.png'),
          SizedBox(
            height: Get.height * 0.05,
          ),
          const Text(
            'Credit Score Calculation Complete',
            style: TextStyle(
              color: ColorResource.mainColor,
              fontSize: 32,
              fontWeight: FontWeight.w900,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: Get.height * 0.15,
          ),
          Image.asset('images/check.png'),
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
