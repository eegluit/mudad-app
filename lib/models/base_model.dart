class BaseModel {
  String? message;
  int? code;

  BaseModel({
    this.message,
    this.code,
  });

  BaseModel.fromJson(Map<String, dynamic> json) {
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
