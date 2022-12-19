import 'package:get/get.dart';
import '../models/select_type_model.dart';
import '../service/credit_service.dart';

class QuizController extends GetxController {
  var isLoading = false.obs;
  var creditService = CreditService();

  var questionId1 = 0.obs;
  var questionId2 = 0.obs;
  var questionId3 = 0.obs;
  var questionId4 = 0.obs;
  var questionId5 = 0.obs;

  List<SelectTypeModel> questionList1 = [
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

}
