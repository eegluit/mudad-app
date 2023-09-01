class UploadProfileSelfieResponseModel {
  String? result;
  String? successMessage;
  String? errorMessage;
  int? code;

  UploadProfileSelfieResponseModel(
      {this.result, this.code, this.successMessage, this.errorMessage});

  UploadProfileSelfieResponseModel.fromJson(Map<String, dynamic> json) {
    result = json["message"];
    code = json["code"];
    successMessage = json["successMessage"];
    errorMessage = json["errorMessage"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["result"] = result;
    map["code"] = code;
    map["successMessage"] = successMessage;
    map["errorMessage"] = errorMessage;
    return map;
  }
}
