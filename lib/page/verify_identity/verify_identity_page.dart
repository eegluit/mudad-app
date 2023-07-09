import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mudad/utils/utils/resource/color_resource.dart';

import 'select_id_type_page.dart';

class VerifyIdentityPage extends StatelessWidget {
  // static const route = '/verifyIdentityPage';
  const VerifyIdentityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> verifyIdentityList = <String>[
      'Your identification document',
      'A quick selfie',
    ];
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 28,
            right: 28,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: Get.height * 0.04,
              ),
              SvgPicture.asset('images/progress.svg'),
              SizedBox(
                height: Get.height * 0.05,
              ),
              const Text(
                'Verify Your Identity',
                style: TextStyle(
                  color: ColorResource.mainColor,
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: Get.height * 0.06,
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 30,
                  right: 30,
                ),
                child: Text(
                  'Simply use your phone camera to capture the following:',
                  style: TextStyle(
                    color: ColorResource.mainColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.10,
              ),
              Container(
                padding: const EdgeInsets.only(left: 40),
                height: 150,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: verifyIdentityList.length,
                  itemBuilder: (context, index) {
                    var pos = index + 1;
                    return Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 35.0,
                              height: 35.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: ColorResource.mainColor,
                                  width: 2,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                  '$pos',
                                  style: const TextStyle(
                                    color: ColorResource.mainColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              verifyIdentityList.elementAt(index),
                              style: const TextStyle(
                                color: ColorResource.mainColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: Get.height * 0.10,
              ),
              SizedBox(
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
                    Get.toNamed(SelectIdTypePage.route);
                  },
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}