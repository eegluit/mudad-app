import 'dart:convert';

CreditScoreModel creditScoreModelFromJson(String str) =>
    CreditScoreModel.fromJson(json.decode(str));

String creditScoreModelToJson(CreditScoreModel data) =>
    json.encode(data.toJson());

class CreditScoreModel {
  CreditScoreModel({
    this.response,
    this.message,
    this.code,
  });

  Response? response;
  String? message;
  int? code;

  factory CreditScoreModel.fromJson(Map<String, dynamic> json) =>
      CreditScoreModel(
        response: Response.fromJson(json["response"] ?? Response()),
        message: json['message'],
        code: json['code'],
      );

  Map<String, dynamic> toJson() => {
        "response": response!.toJson(),
      };
}

class Response {
  Response({
    this.userId,
    this.creditScore,
    this.id,
  });

  String? userId;
  int? creditScore;
  String? id;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        userId: json["userId"] ?? '',
        creditScore: json["credit_score"] ?? 0,
        id: json["id"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "credit_score": creditScore,
        "id": id,
      };
}
