class KycUploadSelfieResponseModel {
  String? message;
  int? code;

  KycUploadSelfieResponseModel({this.message, this.code});

  KycUploadSelfieResponseModel.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    code = json["code"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["message"] = message;
    map["code"] = code;
    return map;
  }
}
