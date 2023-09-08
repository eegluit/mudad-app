import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'personal_info.dart';
import '../../model/utils/resource/color_resource.dart';

class CreditScorePage extends StatelessWidget {
  static const route = '/creditScorePage';
  const CreditScorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> creditInfoList = <String>[
      'Person Info',
      'Bank Statement',
      "Mala`a Report",
      "Quiz"
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
                height: Get.height * 0.05,
              ),
              Image.asset('images/credit_progress1.png'),
              SizedBox(
                height: Get.height * 0.05,
              ),
              const Text(
                'Credit Score',
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
                  left: 40,
                  right: 40,
                ),
                child: Text(
                  'Simply provide the following to calculate your credit score',
                  style: TextStyle(
                    color: ColorResource.mainColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: Get.height * 0.10,
              ),
              Container(
                padding: const EdgeInsets.only(left: 74),
                height: 200,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: creditInfoList.length,
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
                              creditInfoList.elementAt(index),
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
                height: Get.height * 0.15,
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
                    Get.offNamed(PersonalInfoPage.route);
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
