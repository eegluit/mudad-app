class DefaultResponseModel {
  String? result;
  String? successMessage;
  String? errorMessage;
  int? code;

  DefaultResponseModel({
    this.result,
    this.successMessage,
    this.errorMessage,
    this.code,
  });

  DefaultResponseModel.fromJson(Map<String, dynamic> json) {
    result = json["result"];
    successMessage = json["successMessage"];
    errorMessage = json["errorMessage"];
    code = json["code"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["result"] = result;
    map["successMessage"] = successMessage;
    map["errorMessage"] = errorMessage;
    map["code"] = code;
    return map;
  }
}
