class AuthResponseModel {
  String? tokens;
  String? token;
  String? message;
  int? code;

  AuthResponseModel({
    this.tokens,
    this.token,
    this.message,
    this.code,
  });

  AuthResponseModel.fromJson(Map<String, dynamic> json) {
    tokens = json["tokens"];
    token = json["token"];
    message = json["message"];
    code = json["code"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["tokens"] = tokens;
    map["token"] = token;
    map["message"] = message;
    map["code"] = code;
    return map;
  }
}
