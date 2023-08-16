class GetPersonalityQuestionsResponseModel {
  List<QuestionResponseModel>? result;
  String? successMessage;
  String? errorMessage;
  int? code;

  GetPersonalityQuestionsResponseModel(
      {this.result, this.successMessage, this.errorMessage, this.code});
  GetPersonalityQuestionsResponseModel.fromJson(Map<String, dynamic> json) {
    result = (json['result'] as List)
        .map((i) => QuestionResponseModel.fromJson(i))
        .toList();
    successMessage = json['successMessage'];
    errorMessage = json['errorMessage'];
    code = json["code"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["errorMessage"] = errorMessage;
    map["successMessage"] = successMessage;
    map["result"] = result;
    map["code"] = code;
    return map;
  }
}

class QuestionResponseModel {
  String? category;
  String? updatedOn;
  String? createdOn;
  bool? isActive;
  String? questionType;
  String? questionText;
  String? id;

  QuestionResponseModel({
    this.category,
    this.updatedOn,
    this.createdOn,
    this.isActive,
    this.questionText,
    this.questionType,
    this.id,
  });

  QuestionResponseModel.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    updatedOn = json['updatedOn'];
    createdOn = json['createdOn'];
    isActive = json['isActive'];
    questionText = json['questionText'];
    questionType = json['questionType'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["category"] = category;
    map["updatedOn"] = updatedOn;
    map["createdOn"] = createdOn;
    map["isActive"] = isActive;
    map["questionText"] = questionText;
    map["questionType"] = questionType;
    map["id"] = id;
    return map;
  }
}
