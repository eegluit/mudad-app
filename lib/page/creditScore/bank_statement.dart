import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controller/home_controller.dart';
import '../../widget/toast_view/showtoast.dart';
import 'mala_credit_report_page.dart';
import '../../model/utils/resource/color_resource.dart';

class BankStatementPage extends StatelessWidget {
  static const route = '/bankStatementPage';
  static HomeController homeController = Get.find<HomeController>();
  const BankStatementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height * 0.04,
            ),
            Obx(
              () => homeController.selectedBankStatement.value.path != ""
                  ? SvgPicture.asset('images/credit_progress4.svg')
                  : SvgPicture.asset('images/credit_progress3.svg'),
            ),
            //SvgPicture.asset('images/credit_progress3.svg'),
            SizedBox(
              height: Get.height * 0.05,
            ),
            const Text(
              'Upload your Bank Statement',
              style: TextStyle(
                color: ColorResource.mainColor,
                fontSize: 32,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Document Tips - Bank Statement \n\n',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xFF495274)),
                  ),
                  const Text(
                    "Here are a few tips to help you submit the right kind of documents\n\n",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xFF495274),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const <Widget>[
                            Text(
                              "•  ",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xFF495274),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'The document must be issued within the last 3 months (12 months for income tax letters).\n\n',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Color(0xFF495274),
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const <Widget>[
                            Text(
                              "•  ",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xFF495274),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'There must be no manipulation, edits, watermarks, impediments etc. on the document (electronic or paper).\n\n',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Color(0xFF495274),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    'Must contain the following:\n\nFull name & address\nDate of issue\nBank name/ stamp/signature',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xFF495274),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(8.0),
                        dashPattern: const [8, 4],
                        strokeWidth: 2,
                        color: const Color(0xFF9F9BC0),
                        child: Container(
                          height: 44,
                          width: 260,
                          color: Colors.white,
                          child: const Center(
                            child: Text(
                              'Browse to upload',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF495274),
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        onTap: () async {
                          await homeController.pdfPicker().then((value) {
                            if (value.path != "") {
                              homeController.selectedBankStatement.value =
                                  value;
                            }
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          height: 44,
                          decoration: BoxDecoration(
                            color: ColorResource.mainColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              'images/upload.svg',
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Obx(() =>
                      homeController.selectedBankStatement.value.path != ""
                          ? Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                    left: 15,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF9F9BC0),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          homeController.selectedBankStatement
                                              .value.absolute.path
                                              .split('/')
                                              .last,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          homeController.selectedBankStatement
                                              .value = File("");
                                        },
                                        icon: const Icon(Icons.close),
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : Container()),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: Get.width,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (homeController.selectedBankStatement.value.path !=
                            "") {
                          homeController.isLoading(true);
                          homeController.creditService
                              .submitSpendingBehavior(
                                  homeController.selectedBankStatement.value,
                                  'ncHmszl6DXIVmsFdmQ4ZvfVeLCrWfi-IBX4w_RXnB2uKAzFuC74Xqg==',
                                  homeController.getCreditToken)
                              .then((response) {
                            homeController.isLoading(false);
                            if (response.code != 200) {
                              toastShow(error: true, massage: response.errorMessage);
                              // Get.snackbar('Error', '${response.message}',
                              //     snackPosition: SnackPosition.BOTTOM,
                              //     backgroundColor: Colors.red,
                              //     colorText: Colors.white);
                            } else {
                              toastShow(
                                  error: false, massage: 'Bank statement uploaded successfully!');
                              // Get.snackbar('Success', '${response.message}',
                              //     snackPosition: SnackPosition.BOTTOM,
                              //     backgroundColor: Colors.green.shade600,
                              //     colorText: Colors.white);
                              Get.offNamed(MalaCreditReportPage.route);
                            }
                          });
                        } else {
                          Get.snackbar(
                            'Error',
                            "Please Select Browse to upload file",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                        }
                      },
                      child: Obx(
                        () => homeController.isLoading.value
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'Loading...',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ],
                              )
                            : const Text(
                                'Continue',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
