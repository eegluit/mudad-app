import 'dart:convert';

DashBoard? dashBoardFromJson(String str) => DashBoard.fromJson(json.decode(str));

String dashBoardToJson(DashBoard? data) => json.encode(data!.toJson());

class DashBoard {
  DashBoard({
    this.availableLimit,
    this.isKyc,
  });

  int? availableLimit;
  bool? isKyc;

  factory DashBoard.fromJson(Map<String, dynamic> json) => DashBoard(
    availableLimit: json["availableLimit"],
    isKyc: json["isKyc"],
  );

  Map<String, dynamic> toJson() => {
    "availableLimit": availableLimit,
    "isKyc": isKyc,
  };
}
