import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'quiz_page.dart';
import '../../model/utils/resource/color_resource.dart';


class MalaCreditReportPage extends StatelessWidget {
  static const route = '/malaCreditReportPage';
  const MalaCreditReportPage({Key? key}) : super(key: key);

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
          const Text(
            "Mala`a Credit Report",
            style: TextStyle(
              color: ColorResource.mainColor,
              fontSize: 32,
              fontWeight: FontWeight.w900,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: Get.height * 0.20,
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
                Get.offNamed(QuizPage.route);
              },
              child: const Text(
                'Calculate',
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
