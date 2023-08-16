class CreditModuleDefaultResponse {
  String? result;
  String? successMessage;
  String? errorMessage;
  int? code;

  CreditModuleDefaultResponse(
      {this.result, this.code, this.successMessage, this.errorMessage});

  CreditModuleDefaultResponse.fromJson(Map<String, dynamic> json) {
    result = json["result"];
    code = json["code"];
    successMessage = json["successMessage"];
    successMessage = json["successMessage"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["result"] = result;
    map["code"] = code;
    map["successMessage"] = successMessage;
    map["result"] = result;
    return map;
  }
}
