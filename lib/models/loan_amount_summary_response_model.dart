class LoanAmountSummaryResponseModel {
  LoanSummaryResponse? result;
  String? successMessage;
  String? errorMessage;
  int? code;

  LoanAmountSummaryResponseModel({
    this.result,
    this.successMessage,
    this.errorMessage,
    this.code,
  });

  LoanAmountSummaryResponseModel.fromJson(Map<String, dynamic> json) {
    result = LoanSummaryResponse.fromJson(json['result']);
    successMessage = json['successMessage'];
    errorMessage = json['errorMessage'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['result'] = result?.toJson();
    map['successMessage'] = successMessage;
    map['errorMessage'] = errorMessage;
    map['code'] = code;
    return map;
  }
}

class LoanSummaryResponse {
  OneTimeResponse? oneTime;
  SplitResponse? splitResponse;
  InstallmentResponse? installmentResponse;

  LoanSummaryResponse({
    this.installmentResponse,
    this.oneTime,
    this.splitResponse,
  });

  LoanSummaryResponse.fromJson(Map<String, dynamic> json) {
    oneTime = OneTimeResponse.fromJson(json['ONETIME']);
    splitResponse = SplitResponse.fromJson(json['SPLIT']);
    installmentResponse = InstallmentResponse.fromJson(json['INSTALLMENT']);
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['ONETIME'] = oneTime?.toJson();
    map['SPLIT'] = splitResponse?.toJson();
    map['INSTALLMENT'] = installmentResponse?.toJson();
    return map;
  }
}

class OneTimeResponse {
  List<double>? oneMonth;

  OneTimeResponse({
    this.oneMonth,
  });

  OneTimeResponse.fromJson(Map<String, dynamic> json) {
    oneMonth = List<double>.from(json['1 Month']);
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['1 Month'] = oneMonth;
    return map;
  }
}

class SplitResponse {
  List<double>? twoMonth;
  List<double>? threeMonth;

  SplitResponse({
    this.twoMonth,
    this.threeMonth,
  });

  SplitResponse.fromJson(Map<String, dynamic> json) {
    twoMonth = List<double>.from(json['2 Month']);
    threeMonth = List<double>.from(json['3 Month']);
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['2 Month'] = twoMonth;
    map['3 Month'] = threeMonth;
    return map;
  }
}

class InstallmentResponse {
  List<double>? fourMonth;
  List<double>? fiveMonth;
  List<double>? sixMonth;

  InstallmentResponse({
    this.fourMonth,
    this.fiveMonth,
    this.sixMonth,
  });

  InstallmentResponse.fromJson(Map<String, dynamic> json) {
    fourMonth = List<double>.from(json['4 Month']);
    fiveMonth = List<double>.from(json['5 Month']);
    sixMonth = List<double>.from(json['6 Month']);
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['4 Month'] = fourMonth;
    map['5 Month'] = fiveMonth;
    map['6 Month'] = sixMonth;
    return map;
  }
}
