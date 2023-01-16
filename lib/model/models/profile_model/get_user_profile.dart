// To parse this JSON data, do
//
//     final getProfileModel = getProfileModelFromJson(jsonString);

import 'dart:convert';

GetProfileModel? getProfileModelFromJson(String str) => GetProfileModel.fromJson(json.decode(str));

String getProfileModelToJson(GetProfileModel? data) => json.encode(data!.toJson());

class GetProfileModel {
  GetProfileModel({
    this.isDeleted,
    this.role,
    this.isEmailVerified,
    this.name,
    this.email,
    this.id,
    this.isKyc,
    this.storeRegistered,
    this.mobile,
    this.profile
  });

  bool? isDeleted;
  String? role;
  bool? isEmailVerified;
  String? name;
  String? email;
  String? id;
  bool? isKyc;
  bool? storeRegistered;
  String? mobile;
  String? profile;

  factory GetProfileModel.fromJson(Map<String, dynamic> json) => GetProfileModel(
    isDeleted: json["isDeleted"],
    role: json["role"],
    isEmailVerified: json["isEmailVerified"],
    name: json["name"],
    email: json["email"],
    id: json["id"],
    isKyc: json["isKyc"],
    storeRegistered: json["storeRegistered"],
    mobile: json["mobile"],
    profile: json["profile"],
  );

  Map<String, dynamic> toJson() => {
    "isDeleted": isDeleted,
    "role": role,
    "isEmailVerified": isEmailVerified,
    "name": name,
    "email": email,
    "id": id,
    "isKyc": isKyc,
    "storeRegistered": storeRegistered,
    "mobile": mobile,
    "profile": profile,
  };
}
