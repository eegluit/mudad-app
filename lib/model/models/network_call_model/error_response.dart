import '../../../widget/log_print/log_print_condition.dart';

class ErrorResponse {
  List<Errors>? _errors;
  List<Errors>? get errors => _errors;
  ErrorResponse({List<Errors>? errors}) {
    _errors = errors;
  }

  ErrorResponse.fromJson(dynamic json) {
    logPrint("error json=>$json");
    try {
      if (json["errors"] != null) {
        Map<String, dynamic> errorMap = json['errors'];
        _errors = [];
        errorMap.forEach((key, value) {
          _errors!.add(Errors(code: key, message: value[0]));
        });
      }
    } catch (e) {
      _errors = [];
      _errors!.add(Errors(code: "404", message: "Something went wrong"));
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_errors != null) {
      map["errors"] = _errors!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Errors {
  String? _code;
  String? _message;

  String? get code => _code;
  String? get message => _message;

  Errors({String? code, String? message}) {
    _code = code;
    _message = message;
  }

  Errors.fromJson(dynamic json) {
    _code = json["code"];
    _message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["code"] = _code;
    map["message"] = _message;
    return map;
  }
}
