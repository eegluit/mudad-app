import 'dart:convert';

GenerateReceiptResponseModel userModelFromJson(String str) =>
    GenerateReceiptResponseModel.fromJson(json.decode(str));

String userModelToJson(GenerateReceiptResponseModel data) =>
    json.encode(data.toJson());

class GenerateReceiptResponseModel {
  GenerateReceiptResponseModel({
    this.result,
    this.successMessage,
    this.errorMessage,
    this.code,
  });

  ReceiptResponse? result;
  String? successMessage;
  String? errorMessage;
  int? code;

  factory GenerateReceiptResponseModel.fromJson(Map<String, dynamic> json) =>
      GenerateReceiptResponseModel(
        result: ReceiptResponse.fromJson(json["result"] ?? {}),
        successMessage: json['successMessage'],
        errorMessage: json['errorMessage'],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "result": result!.toJson(),
      };
}

class ReceiptResponse {
  ReceiptResponse(
      {this.id,
      this.productSummary,
      this.price,
      this.taxPercentage,
      this.total,
      this.address,
      this.name,
      this.phone,
      this.createdOn,
      this.isActive,
      this.merchantUserId,
      this.invoice,
      this.consumerId,
      this.consumerName});

  String? id;
  String? productSummary;
  double? price;
  int? taxPercentage;
  double? total;
  String? address;
  String? name;
  String? phone;
  String? createdOn;
  bool? isActive;
  String? merchantUserId;
  int? invoice;
  String? consumerId;
  String? consumerName;

  factory ReceiptResponse.fromJson(Map<String, dynamic> json) =>
      ReceiptResponse(
        id: json["id"],
        productSummary: json["productSummary"],
        price: json["price"],
        taxPercentage: json["taxPercentage"],
        total: json["total"],
        address: json["address"],
        name: json["name"],
        phone: json["phone"],
        createdOn: json["createdOn"],
        isActive: json["isActive"],
        merchantUserId: json["merchantUserId"],
        invoice: json["invoice"],
        consumerId: json["consumerId"],
        consumerName: json["consumerName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productSummary": productSummary,
        "price": price,
        "taxPercentage": taxPercentage,
        "total": total,
        "address": address,
        "name": name,
        "phone": phone,
        "createdOn": createdOn,
        "isActive": isActive,
        "merchantUserId": merchantUserId,
        "invoice": invoice,
        "consumerId": consumerId,
        "consumerName": consumerName,
      };
}
