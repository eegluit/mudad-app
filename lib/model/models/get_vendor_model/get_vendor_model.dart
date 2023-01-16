// To parse this JSON data, do
//
//     final getVendorsModel = getVendorsModelFromJson(jsonString);

import 'dart:convert';

GetVendorsModel? getVendorsModelFromJson(String str) => GetVendorsModel.fromJson(json.decode(str));

String getVendorsModelToJson(GetVendorsModel? data) => json.encode(data!.toJson());

class GetVendorsModel {
  GetVendorsModel({
    this.storeData,
  });

  List<StoreDatum?>? storeData;

  factory GetVendorsModel.fromJson(Map<String, dynamic> json) => GetVendorsModel(
    storeData: json["storeData"] == null ? [] : List<StoreDatum?>.from(json["storeData"]!.map((x) => StoreDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "storeData": storeData == null ? [] : List<dynamic>.from(storeData!.map((x) => x!.toJson())),
  };
}

class StoreDatum {
  StoreDatum({
    this.name,
    this.logo,
  });

  String? name;
  String? logo;

  factory StoreDatum.fromJson(Map<String, dynamic> json) => StoreDatum(
    name: json["name"],
    logo: json["logo"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "logo": logo,
  };
}
