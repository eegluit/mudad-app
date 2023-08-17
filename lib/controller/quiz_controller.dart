import 'package:get/get.dart';
import 'package:mudad/model/models/profile_model/get_profile_model.dart';
import 'package:mudad/models/personality_test_questions_response_model.dart';
import '../models/select_type_model.dart';
import '../service/credit_service.dart';

class QuizController extends GetxController {
  var isLoading = false.obs;
  var creditService = CreditService();
  var quizQuestions = <QuestionResponseModel>[];

  var questionId1 = 0.obs;
  var questionId2 = 0.obs;
  var questionId3 = 0.obs;
  var questionId4 = 0.obs;
  var questionId5 = 0.obs;

  List<SelectTypeModel> responseOptionList = [
    SelectTypeModel(
      id: 1,
      name: "Strongrly inaccurate",
    ),
    SelectTypeModel(
      id: 2,
      name: "Inaccurate",
    ),
    SelectTypeModel(
      id: 3,
      name: "Neutral",
    ),
    SelectTypeModel(
      id: 4,
      name: "Acurate",
    ),
    SelectTypeModel(
      id: 5,
      name: "Strongly Acurate",
    ),
  ];

  Future<void> getProfile() async {
  try {
    var response = await creditService.getPersonalityTestQuestions('_qcu9y-FVInVVxoG-OoWZJV9aH_3Kk9xnEceb0FzDiOnAzFuXGsgsg==');
    if (response.code != 200) {
      print('ABC error');
    } else {
      quizQuestions = response.result!;
    }
  } catch (e) {
    print('Error fetching profile: $e');
  }
}


  @override
  void onInit() {
    getProfile();
    super.onInit();
  }
}
