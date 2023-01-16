class SignUpRequestModel {
  String? name;
  String? email;
  String? password;

  SignUpRequestModel({
    this.name,
    this.email,
    this.password,
  });

  SignUpRequestModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    email = json["email"];
    password = json["password"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = name;
    map["email"] = email;
    map["password"] = password;
    return map;
  }
}
