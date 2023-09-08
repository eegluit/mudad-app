import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controller/take_selfie_controller.dart';
import 'verification_complete_page.dart';
import 'package:mudad/utils/utils/resource/color_resource.dart';

class TakeSelfiePage extends StatelessWidget {
  static const route = '/takeSelfiePage';
  static TakeSelfieController selfieController =
      Get.find<TakeSelfieController>();
  const TakeSelfiePage({Key? key}) : super(key: key);

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
          Image.asset('images/progress2.png'),
          SizedBox(
            height: Get.height * 0.05,
          ),
          const Text(
            'Take a Selfie',
            style: TextStyle(
              color: ColorResource.mainColor,
              fontSize: 32,
              fontWeight: FontWeight.w900,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: Get.height * 0.10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 40, right: 16),
            child: Text(
              'Place your face inside the oval and press start when you are ready',
              style: TextStyle(
                color: ColorResource.mainColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.05,
          ),
          Obx(
            () => Container(
              height: 200,
              width: 150,
              margin: const EdgeInsets.only(top: 40, left: 40, right: 40),
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(
                  color: Colors.black,
                  width: 0.0,
                ),
                borderRadius:
                    const BorderRadius.all(Radius.elliptical(200, 120)),
              ),
              child: selfieController.photo.value.path.isEmpty
                  ? SvgPicture.asset('images/home.svg')
                  : Image.file(File(selfieController.photo.value.path)),
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
                selfieController.imagePicker();
              },
              child: const Text(
                'Start',
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
                Get.toNamed(VerificationCompletePage.route);
              },
              child: const Text(
                'Next',
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
