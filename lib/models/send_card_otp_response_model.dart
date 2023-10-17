import 'dart:convert';

CardVerificationResponseModel userModelFromJson(String str) =>
    CardVerificationResponseModel.fromJson(json.decode(str));

String userModelToJson(CardVerificationResponseModel data) =>
    json.encode(data.toJson());

class CardVerificationResponseModel {
  CardVerificationResponseModel({
    this.result,
    this.successMessage,
    this.errorMessage,
    this.code,
  });

  CardResultResponse? result;
  String? successMessage;
  String? errorMessage;
  int? code;

  factory CardVerificationResponseModel.fromJson(Map<String, dynamic> json) =>
      CardVerificationResponseModel(
        result: CardResultResponse.fromJson(json["result"] ?? {}),
        successMessage: json['successMessage'],
        errorMessage: json['errorMessage'],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "result": result!.toJson(),
        "successMessage": successMessage,
        "errorMessage": errorMessage
      };
}

class CardResultResponse {
  CardResultResponse({
    this.status,
    this.payObject,
    this.error,
  });

  int? status;
  ErrorCardResponse? error;
  PayLoadResultResponse? payObject;

  factory CardResultResponse.fromJson(Map<String, dynamic> json) =>
      CardResultResponse(
        status: json["status"],
        error: ErrorCardResponse.fromJson(json["error"] ?? {}),
        payObject: PayLoadResultResponse.fromJson(json["payObject"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "payObject": payObject!.toJson(),
        "error": error!.toJson(),
        "status": status
      };
}

class ErrorCardResponse {
  ErrorCardResponse({
    this.code,
    this.desc,
  });

  int? code;
  String? desc;

  factory ErrorCardResponse.fromJson(Map<String, dynamic> json) =>
      ErrorCardResponse(
        code: json["code"],
        desc: json["desc"],
      );

  Map<String, dynamic> toJson() => {"code": code, "desc": desc};
}

class PayLoadResultResponse {
  PayLoadResultResponse(
      {this.paymentId,
      this.payUrl,
      this.payStatus,
      this.result,
      this.tranId,
      this.trackId,
      this.refNo,
      this.authCode,
      this.secCard,
      this.secExpMon,
      this.secExpYear,
      this.secCvv,
      this.cardName,
      this.currency,
      this.orderId,
      this.amount,
      this.mobileNo,
      this.notes,
      this.email,
      this.secOtp,
      this.reInit,
      this.cardMask,
      this.tokenNumber});

  String? paymentId;
  String? payUrl;
  String? payStatus;
  String? result;
  String? tranId;
  String? trackId;
  String? refNo;
  String? authCode;
  String? secCard;
  String? secExpMon;
  String? secExpYear;
  String? secCvv;
  String? cardName;
  String? currency;
  String? orderId;
  String? amount;
  String? mobileNo;
  String? notes;
  String? email;
  String? secOtp;
  bool? reInit;
  String? cardMask;
  String? tokenNumber;

  factory PayLoadResultResponse.fromJson(Map<String, dynamic> json) =>
      PayLoadResultResponse(
        paymentId: json["paymentId"],
        payUrl: json["payUrl"],
        payStatus: json["payStatus"],
        result: json["result"],
        tranId: json["tranId"],
        trackId: json["trackId"],
        refNo: json["refNo"],
        authCode: json["authCode"],
        secCard: json["secCard"],
        secExpMon: json["secExpMon"],
        secExpYear: json["secExpYear"],
        secCvv: json["secCvv"],
        cardName: json["cardName"],
        currency: json["currency"],
        orderId: json["orderId"],
        amount: json["amount"],
        mobileNo: json["mobileNo"],
        notes: json["notes"],
        email: json["email"],
        secOtp: json["secOtp"],
        reInit: json["reInit"],
        cardMask: json["cardMask"],
        tokenNumber: json["tokenNumber"],
      );

  Map<String, dynamic> toJson() => {
        "paymentId": paymentId,
        "payUrl": payUrl,
        "payStatus": payStatus,
        "result": result,
        "tranId": tranId,
        "trackId": trackId,
        "refNo": refNo,
        "authCode": authCode,
        "secCard": secCard,
        "secExpMon": secExpMon,
        "secExpYear": secExpYear,
        "secCvv": secCvv,
        "cardName": cardName,
        "currency": currency,
        "orderId": orderId,
        "amount": amount,
        "mobileNo": mobileNo,
        "notes": notes,
        "email": email,
        "secOtp": secOtp,
        "reInit": reInit,
        "cardMask": cardMask,
        "tokenNumber": tokenNumber,
      };
}
