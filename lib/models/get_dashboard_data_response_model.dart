import 'dart:convert';

GetDashboardDataResponseModel userModelFromJson(String str) =>
    GetDashboardDataResponseModel.fromJson(json.decode(str));

String userModelToJson(GetDashboardDataResponseModel data) =>
    json.encode(data.toJson());


class GetDashboardDataResponseModel {
  DashboardResponseModel? result;
  int? code;
  String? successMessage;
  String? errorMessage;

  GetDashboardDataResponseModel(
      {this.result, this.code, this.successMessage, this.errorMessage});

  factory GetDashboardDataResponseModel.fromJson(Map<String, dynamic> json) =>
      GetDashboardDataResponseModel(
        result: DashboardResponseModel.fromJson(json["result"] ?? {}),
        successMessage: json['successMessage'],
        errorMessage: json['errorMessage'],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "result": result!.toJson(),
      };
}

class DashboardResponseModel {
  bool? isKycComplemeted;
  double? availableCredit;
  bool? isCreditScoreCalculated;
  int? creditScore;

  DashboardResponseModel({
    this.isKycComplemeted,
    this.availableCredit,
    this.isCreditScoreCalculated,
    this.creditScore,
  });

  DashboardResponseModel.fromJson(Map<String, dynamic> json) {
    isKycComplemeted = json['isKycComplemeted'];
    availableCredit = json['availableCredit'];
    isCreditScoreCalculated = json['isCreditScoreCalculated'];
    creditScore = json['creditScore'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["isKycComplemeted"] = isKycComplemeted;
    map["availableCredit"] = availableCredit;
    map["isCreditScoreCalculated"] = isCreditScoreCalculated;
    map["creditScore"] = creditScore;
    return map;
  }
}
