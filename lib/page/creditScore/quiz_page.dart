import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mudad/models/personality_questions_request_model.dart';
import '../../controller/home_controller.dart';
import '../../controller/quiz_controller.dart';
import '../../models/question_request_model.dart';
import '../../widget/toast_view/showtoast.dart';
import 'credit_complete.dart';
import 'package:mudad/utils/utils/resource/color_resource.dart';
import '../../models/personality_test_questions_response_model.dart';

class QuizPage extends StatelessWidget {
  static const route = '/quizPage';
  static QuizController quizController = Get.find<QuizController>();
  static HomeController homeController = Get.find<HomeController>();
  const QuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
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
                  child: Obx(
                    () => Column(
                      children: [
                        ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: quizController.quizQuestions.length,
                          itemBuilder: (BuildContext context, int index) {
                            var question =
                                quizController.quizQuestions[index];
                            RxInt selectedAnswer =
                                quizController.selectedAnswers[index] ??
                                    RxInt(-1);
                            return Column(
                              children: [
                                Text(
                                  '${index + 1}.  ${question.questionText!}',
                                  style: const TextStyle(
                                    color: Color(0xff000000),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  physics:
                                      const NeverScrollableScrollPhysics(),
                                  itemCount:
                                      quizController.responseOptionList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var data = quizController
                                        .responseOptionList
                                        .elementAt(index);
                                    return Obx(
                                      () => Card(
                                        elevation: 10,
                                        margin: const EdgeInsets.only(
                                          left: 36,
                                          right: 36,
                                          top: 10,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: RadioListTile<int>(
                                          contentPadding:
                                              const EdgeInsets.all(0),
                                          visualDensity:
                                              const VisualDensity(
                                            vertical:
                                                VisualDensity.minimumDensity,
                                          ),
                                          title: Text(
                                            "${data.name}",
                                            style: const TextStyle(
                                              color: ColorResource.mainColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          groupValue: selectedAnswer.value,
                                          value: data.id!,
                                          onChanged: (val) {
                                            selectedAnswer.value = val!;
                                            quizController
                                                .quizQuestions[index]
                                                .response = val;
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 30,
                                )
                              ],
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
                                quizController.creditService.submitPersonalityQuiz(
                                    createQuizResponseModel(
                                        quizController.quizQuestions),
                                    'ncHmszl6DXIVmsFdmQ4ZvfVeLCrWfi-IBX4w_RXnB2uKAzFuC74Xqg==')
                                    .then((response) {
                                  quizController.isLoading(false);
                                  if (response.code != 200) {
                                toastShow(error: true, massage: response.errorMessage);
                              // Get.snackbar('Error', '${response.message}',
                              //     snackPosition: SnackPosition.BOTTOM,
                              //     backgroundColor: Colors.red,
                              //     colorText: Colors.white);
                                  } else {
                                    toastShow(
                                    error: false, massage: response.successMessage);
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                ),
              ],
            ),
          ),
        ),
        Obx(() {
          return Visibility(
            visible: quizController.isFetching.value,
            child: Container(
              color: ColorResource.white.withOpacity(1),
              child: Center(
                child: CircularProgressIndicator(
                  color: ColorResource.mainColor,
                ),
              ),
            ),
          );
        }),
      ],
    );
  }

  PersonalityQuestionsRequestModel createQuizResponseModel(
      List<QuestionResponseModel> quizQuestions) {
    List<int> conscientiousness = [];
    List<int> neuroticism = [];
    List<int> financialSelfEfficacy = [];
    List<int> socialSupport = [];

    for (var ques in quizQuestions) {
      switch (ques.category) {
        case 'Conscientiousness':
          conscientiousness.add(ques.response!);
          break;
        case 'Neuroticism':
          neuroticism.add(ques.response!);
          break;
        case 'Financial Self-Efficacy':
          financialSelfEfficacy.add(ques.response!);
          break;
        case 'Social Support':
          socialSupport.add(ques.response!);
          break;
      }
    }
    return PersonalityQuestionsRequestModel(
        userId: '64c804be20dac0a4e216f896',
        conscientiousness: conscientiousness,
        neuroticism: neuroticism,
        financialSelfEfficacy: financialSelfEfficacy,
        socialSupport: socialSupport);
  }

  bool validate(QuizController controller) {
    for (var ques in controller.quizQuestions) {
      if (ques.response == null || ques.response == -1) {
        Get.snackbar(
          'Error',
          "Please Select Answer to the remaining Questions",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return false;
      }
    }
    return true;
  }
}
