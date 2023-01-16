// To parse this JSON data, do
//
//     final getProfileModel = getProfileModelFromJson(jsonString);

import 'dart:convert';

GetCreditProfileModel? getProfileModelFromJson(String str) => GetCreditProfileModel.fromJson(json.decode(str));

String getProfileModelToJson(GetCreditProfileModel? data) => json.encode(data!.toJson());

class GetCreditProfileModel {
  GetCreditProfileModel({
    this.result,
  });

  Result? result;

  factory GetCreditProfileModel.fromJson(Map<String, dynamic> json) => GetCreditProfileModel(
    result: json["result"] == null? Result():Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "result": result!.toJson(),
  };
}

class Result {
  Result({
    this.firstName,
    this.lastName,
    this.gender,
    this.profession,
    this.employer,
    this.employerAddress,
    this.monthlyIncome,
    this.userId,
    this.id,
  });

  String? firstName;
  String? lastName;
  String? gender;
  String? profession;
  String? employer;
  String? employerAddress;
  int? monthlyIncome;
  String? userId;
  String? id;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    firstName: json["firstName"],
    lastName: json["lastName"],
    gender: json["gender"],
    profession: json["profession"],
    employer: json["employer"],
    employerAddress: json["employer_address"],
    monthlyIncome: json["monthly_income"],
    userId: json["userId"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "gender": gender,
    "profession": profession,
    "employer": employer,
    "employer_address": employerAddress,
    "monthly_income": monthlyIncome,
    "userId": userId,
    "id": id,
  };
}
