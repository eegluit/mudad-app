class GenerateLoanResponseModel {
  List<String>? result;
  String? successMessage;
  String? errorMessage;
  int? code;

  GenerateLoanResponseModel({
    this.result,
    this.successMessage,
    this.errorMessage,
    this.code,
  });

  GenerateLoanResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = List<String>.from(json['result']);
    }
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
