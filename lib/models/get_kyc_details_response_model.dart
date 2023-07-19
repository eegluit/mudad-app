class GetKycDetailsResponseModel {
  KycDetailsResponse? response;
  int? code;
  String? message;

  GetKycDetailsResponseModel({this.response, this.code, this.message});

  GetKycDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    response = json["response"];
    code = json["code"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["response"] = response;
    map["code"] = code;
    map["message"] = message;
    return map;
  }
}

class KycDetailsResponse {
  String? id;
  String? idType;
  String? kycDoc;
  String? selfie;

  KycDetailsResponse({this.id, this.idType, this.kycDoc, this.selfie});

  KycDetailsResponse.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    idType = json["idType"];
    idType = json["kycDoc"];
    idType = json["selfie"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["idType"] = idType;
    map["kycDoc"] = kycDoc;
    map["selfie"] = selfie;
    return map;
  }
}
