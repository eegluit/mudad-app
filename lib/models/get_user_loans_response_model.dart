class GetUserLoansResponseModel {
  List<LoanResponseModel>? result;
  int? code;
  String? successMessage;
  String? errorMessage;

  GetUserLoansResponseModel(
      {this.result, this.code, this.successMessage, this.errorMessage});

  GetUserLoansResponseModel.fromJson(Map<String, dynamic> json) {
    result = (json['result'] as List)
        .map((i) => LoanResponseModel.fromJson(i))
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


class LoanResponseModel {
  String? id;
  String? userId;
  String? transactionId;
  double? loanAmount;
  String? dueDate;
  String? transactionType;
  String? status;
  bool? isAmountPaid;

  LoanResponseModel(
      {this.id,
      this.userId,
      this.transactionId,
      this.loanAmount,
      this.dueDate,
      this.transactionType,
      this.status,
      this.isAmountPaid});

  LoanResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    transactionId = json['transactionId'];
    loanAmount = json['loanAmount'];
    dueDate = json['dueDate'];
    transactionType = json['transactionType'];
    status = json['status'];
    isAmountPaid = json['isAmountPaid'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["userId"] = userId;
    map["transactionId"] = transactionId;
    map["loanAmount"] = loanAmount;
    map["dueDate"] = dueDate;
    map["transactionType"] = transactionType;
    map["status"] = status;
    map["isAmountPaid"] = isAmountPaid;
    return map;
  }
}
