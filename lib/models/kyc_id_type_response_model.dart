class KycIdTypeResponseModel {
  String? message;
  int? code;

  KycIdTypeResponseModel({this.message, this.code});

  KycIdTypeResponseModel.fromJson(Map<String, dynamic> json) {
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
