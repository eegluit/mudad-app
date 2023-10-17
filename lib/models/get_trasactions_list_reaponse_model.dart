import 'dart:ffi';

class GetTransactionResponseModel {
  List<TranactionResponseModel>? result;
  int? code;
  String? successMessage;
  String? errorMessage;

  GetTransactionResponseModel(
      {this.result, this.code, this.successMessage, this.errorMessage});

  GetTransactionResponseModel.fromJson(Map<String, dynamic> json) {
    result = (json['result'] as List)
        .map((i) => TranactionResponseModel.fromJson(i))
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

class TranactionResponseModel {
  String? userId;
  String? id;
  String? merchantId;
  String? paidTo;
  String? productId;
  double? paidAmount;
  String? transactionDate;
  String? transactionType;
  String? status;
  bool? isBilled;

  TranactionResponseModel(
      {this.userId,
      this.id,
      this.merchantId,
      this.paidTo,
      this.paidAmount,
      this.transactionDate,
      this.transactionType,
      this.status,
      this.isBilled,
      });

  TranactionResponseModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    merchantId = json['merchantId'];
    paidTo = json['paidTo'];
    paidAmount = json['paidAmount'];
    transactionDate = json['transactionDate'];
    transactionType = json['transactionType'];
    status = json['status'];
    isBilled = json['isBilled'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["userId"] = userId;
    map["id"] = id;
    map["merchantId"] = merchantId;
    map["paidTo"] = paidTo;
    map["paidAmount"] = paidAmount;
    map["transactionDate"] = transactionDate;
    map["transactionType"] = transactionType;
    map["status"] = status;
    map["isBilled"] = isBilled;
    return map;
  }
}
