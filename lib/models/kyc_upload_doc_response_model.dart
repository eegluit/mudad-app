class KycUploadDocResponseModel {
  String? message;
  int? code;

  KycUploadDocResponseModel({this.message, this.code});

  KycUploadDocResponseModel.fromJson(Map<String, dynamic> json) {
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
