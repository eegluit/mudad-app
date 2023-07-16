class KycIdTypeRequestModel {
  String? kycIdType;

  KycIdTypeRequestModel({
    this.kycIdType,
  });

  KycIdTypeRequestModel.fromJson(Map<String, dynamic> json) {
    kycIdType = json["kycIdType"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["kycIdType"] = kycIdType;
    return map;
  }
}
