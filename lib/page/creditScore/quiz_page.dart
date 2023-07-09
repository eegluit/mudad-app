import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controller/home_controller.dart';
import '../../controller/quiz_controller.dart';
import '../../models/question_request_model.dart';
import '../../widget/toast_view/showtoast.dart';
import 'credit_complete.dart';
import 'package:mudad/utils/utils/resource/color_resource.dart';

class QuizPage extends StatelessWidget {
  static const route = '/quizPage';
  static QuizController quizController = Get.find<QuizController>();
  static HomeController homeController = Get.find<HomeController>();
  const QuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.04,
            ),
            SvgPicture.asset('images/credit_progress5.svg'),
            SizedBox(
              height: Get.height * 0.05,
            ),
            const Text(
              'QUIZ',
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
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Column(
                children: [
                  const Text(
                    '1. Have you paid your all yours bills on time?',
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: quizController.questionList1.length,
                    itemBuilder: (BuildContext context, int index) {
                      var data = quizController.questionList1.elementAt(index);
                      return Obx(
                        () => Card(
                          elevation: 10,
                          margin: const EdgeInsets.only(
                            left: 36,
                            right: 36,
                            top: 10,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: RadioListTile<int>(
                            contentPadding: const EdgeInsets.all(0),
                            visualDensity: const VisualDensity(
                              vertical: VisualDensity.minimumDensity,
                            ),
                            title: Text(
                              "${data.name}",
                              style: const TextStyle(
                                color: ColorResource.mainColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            groupValue: quizController.questionId1.value,
                            value: data.id!,
                            onChanged: (val) {
                              quizController.questionId1.value = val!;
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    '2. How often do you neglect others needs and spend more on yourself?',
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: quizController.questionList1.length,
                    itemBuilder: (BuildContext context, int index) {
                      var data = quizController.questionList1.elementAt(index);
                      return Obx(
                        () => Card(
                          elevation: 10,
                          margin: const EdgeInsets.only(
                            left: 36,
                            right: 36,
                            top: 10,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: RadioListTile<int>(
                            contentPadding: const EdgeInsets.all(0),
                            visualDensity: const VisualDensity(
                              vertical: VisualDensity.minimumDensity,
                            ),
                            title: Text(
                              "${data.name}",
                              style: const TextStyle(
                                color: ColorResource.mainColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            groupValue: quizController.questionId2.value,
                            value: data.id!,
                            onChanged: (val) {
                              quizController.questionId2.value = val!;
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    '3. Do you shop or buy so much that it negatively effects your daily obligations (like loan repayments)?',
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: quizController.questionList1.length,
                    itemBuilder: (BuildContext context, int index) {
                      var data = quizController.questionList1.elementAt(index);
                      return Obx(
                        () => Card(
                          elevation: 10,
                          margin: const EdgeInsets.only(
                            left: 36,
                            right: 36,
                            top: 10,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: RadioListTile<int>(
                            contentPadding: const EdgeInsets.all(0),
                            visualDensity: const VisualDensity(
                              vertical: VisualDensity.minimumDensity,
                            ),
                            title: Text(
                              "${data.name}",
                              style: const TextStyle(
                                color: ColorResource.mainColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            groupValue: quizController.questionId3.value,
                            value: data.id!,
                            onChanged: (val) {
                              quizController.questionId3.value = val!;
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    '4. How often do you get anxious about your repayments?',
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: quizController.questionList1.length,
                    itemBuilder: (BuildContext context, int index) {
                      var data = quizController.questionList1.elementAt(index);
                      return Obx(
                        () => Card(
                          elevation: 10,
                          margin: const EdgeInsets.only(
                            left: 36,
                            right: 36,
                            top: 10,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: RadioListTile<int>(
                            contentPadding: const EdgeInsets.all(0),
                            visualDensity: const VisualDensity(
                              vertical: VisualDensity.minimumDensity,
                            ),
                            title: Text(
                              "${data.name}",
                              style: const TextStyle(
                                color: ColorResource.mainColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            groupValue: quizController.questionId4.value,
                            value: data.id!,
                            onChanged: (val) {
                              quizController.questionId4.value = val!;
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    '5. Most of the time, I avoid taking responsibilities?',
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: quizController.questionList1.length,
                    itemBuilder: (BuildContext context, int index) {
                      var data = quizController.questionList1.elementAt(index);
                      return Obx(
                        () => Card(
                          elevation: 10,
                          margin: const EdgeInsets.only(
                            left: 36,
                            right: 36,
                            top: 10,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: RadioListTile<int>(
                            contentPadding: const EdgeInsets.all(0),
                            visualDensity: const VisualDensity(
                              vertical: VisualDensity.minimumDensity,
                            ),
                            title: Text(
                              "${data.name}",
                              style: const TextStyle(
                                color: ColorResource.mainColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            groupValue: quizController.questionId5.value,
                            value: data.id!,
                            onChanged: (val) {
                              quizController.questionId5.value = val!;
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 60,
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
                        if (validate(quizController)) {
                          quizController.isLoading(true);
                          quizController.creditService
                              .addQuiz(
                            QuestionRequestModel(quizData: [
                              QuizData(
                                que: 1,
                                ans: quizController.questionId1.value,
                              ),
                              QuizData(
                                que: 2,
                                ans: quizController.questionId2.value,
                              ),
                              QuizData(
                                que: 3,
                                ans: quizController.questionId3.value,
                              ),
                              QuizData(
                                que: 4,
                                ans: quizController.questionId4.value,
                              ),
                              QuizData(
                                que: 5,
                                ans: quizController.questionId5.value,
                              ),
                            ]),
                            homeController.getToken,
                          )
                              .then((response) {
                            quizController.isLoading(false);
                            if (response.code != null) {
                              toastShow(error: true,massage: response.message);
                              // Get.snackbar('Error', '${response.message}',
                              //     snackPosition: SnackPosition.BOTTOM,
                              //     backgroundColor: Colors.red,
                              //     colorText: Colors.white);
                            } else {
                              toastShow(error: false,massage: response.message);
                              // Get.snackbar('Success', '${response.message}',
                              //     snackPosition: SnackPosition.BOTTOM,
                              //     backgroundColor: Colors.green.shade600,
                              //     colorText: Colors.white);
                              quizController.questionId1(0);
                              quizController.questionId2(0);
                              quizController.questionId3(0);
                              quizController.questionId4(0);
                              quizController.questionId5(0);
                              Get.offNamed(CreditCompleteScorePage.route);
                            }
                          });
                        }
                      },
                      child: Obx(
                        () => quizController.isLoading.value
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
                    height: 60,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool validate(QuizController controller) {
    if (controller.questionId1.value == 0) {
      Get.snackbar(
        'Error',
        "Please Select Question no. 1",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    } else if (controller.questionId2.value == 0) {
      Get.snackbar(
        'Error',
        "Please Select Question no. 2",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    } else if (controller.questionId3.value == 0) {
      Get.snackbar(
        'Error',
        "Please Select Question no. 3",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    } else if (controller.questionId4.value == 0) {
      Get.snackbar(
        'Error',
        "Please Select Question no. 4",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    } else if (controller.questionId5.value == 0) {
      Get.snackbar(
        'Error',
        "Please Select Question no. 5",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
    return true;
  }
}
