import 'dart:convert';

QuestionRequestModel questionRequestModelFromJson(String str) => QuestionRequestModel.fromJson(json.decode(str));

String questionRequestModelToJson(QuestionRequestModel data) => json.encode(data.toJson());

class QuestionRequestModel {
    QuestionRequestModel({
        this.quizData,
    });

    List<QuizData>? quizData;

    factory QuestionRequestModel.fromJson(Map<String, dynamic> json) => QuestionRequestModel(
        quizData: List<QuizData>.from(json["quizData"].map((x) => QuizData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "quizData": List<dynamic>.from(quizData!.map((x) => x.toJson())),
    };
}

class QuizData {
    QuizData({
        this.que,
        this.ans,
    });

    int? que;
    int? ans;

    factory QuizData.fromJson(Map<String, dynamic> json) => QuizData(
        que: json["que"],
        ans: json["ans"],
    );

    Map<String, dynamic> toJson() => {
        "que": que,
        "ans": ans,
    };
}
