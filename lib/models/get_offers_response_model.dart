import 'dart:ffi';

class GetOfferResponseModel {
  List<OfferResponseModel>? result;
  int? code;
  String? successMessage;
  String? errorMessage;

  GetOfferResponseModel(
      {this.result, this.code, this.successMessage, this.errorMessage});

  GetOfferResponseModel.fromJson(Map<String, dynamic> json) {
    result = (json['result'] as List)
        .map((i) => OfferResponseModel.fromJson(i))
        .toList();
    code = json['code'];
    successMessage = json['successMessage'];
    errorMessage = json['errorMessage'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["successMessage"] = successMessage;
    map["errorMessage"] = errorMessage;
    map["result"] = result;
    return map;
  }
}


class OfferResponseModel {
  String? id;
  String? couponCode;
  int? discount;
  String? discountType;
  String? validFrom;
  String? validTo;
  int? numberOfTime;
  String? description;
  bool? isActive;
  String? createdOn;
  String? modifiedOn;
  String? userId;

  OfferResponseModel(
      {this.id,
      this.couponCode,
      this.discount,
      this.discountType,
      this.validFrom,
      this.validTo,
      this.numberOfTime,
      this.description,
      this.isActive,
      this.createdOn,
      this.modifiedOn,
      this.userId});

  OfferResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    couponCode = json['couponCode'];
    discount = json['discount'];
    discountType = json['discountType'];
    validFrom = json['validFrom'];
    validTo = json['validTo'];
    numberOfTime = json['numberOfTime'];
    description = json['description'];
    isActive = json['isActive'];
    createdOn = json['createdOn'];
    modifiedOn = json['modifiedOn'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["couponCode"] = couponCode;
    map["discount"] = discount;
    map["discountType"] = discountType;
    map["validFrom"] = validFrom;
    map["validTo"] = validTo;
    map["numberOfTime"] = numberOfTime;
    map["description"] = description;
    map["isActive"] = isActive;
    map["createdOn"] = createdOn;
    map["modifiedOn"] = modifiedOn;
    map["userId"] = userId;
    return map;
  }
}
