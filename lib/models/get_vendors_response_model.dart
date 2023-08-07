class GetVendorsResponseModel {
  List<VendorsResponseModel>? response;
  int? code;
  String? message;

  GetVendorsResponseModel({
    this.response,
    this.code,
    this.message,
  });
GetVendorsResponseModel.fromJson(Map<String, dynamic> json) {
    response = (json['response'] as List)
    .map((i) => VendorsResponseModel.fromJson(i))
    .toList();
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["code"] = code;
    map["message"] = message;
    map["response"] = response;
    return map;
  }
}

class VendorsResponseModel {
  bool? isDeleted;
  String? userId;
  Logo? logo;
  String? name;
  String? address;
  String? lat;
  String? long;
  String? id;
  

  VendorsResponseModel({
    this.isDeleted,
    this.userId,
    this.logo,
    this.name,
    this.address,
    this.lat,
    this.long,
    this.id,
  });

  VendorsResponseModel.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    userId = json['userId'];
    logo = Logo.fromJson(json['logo']);
    name = json['name'];
    address = json['address'];
    lat = json['lat'];
    long = json['long'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["isDeleted"] = isDeleted;
    map["userId"] = userId;
    map["logo"] = logo;
    map["name"] = name;
    map["address"] = address;
    map["lat"] = lat;
    map["long"] = long;
    map["id"] = id;
    return map;
  }
}

class Logo {
  String? createdBy;
  String? document;
  String? id;

  Logo({this.createdBy, this.id, this.document});

  Logo.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    createdBy = json["createdBy"];
    document = json["document"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["createdBy"] = createdBy;
    map["document"] = document;
    return map;
  }
}
