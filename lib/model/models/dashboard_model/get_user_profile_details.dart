import 'dart:convert';

GetUserProfileDetails userModelFromJson(String str) =>
    GetUserProfileDetails.fromJson(json.decode(str));

String userModelToJson(GetUserProfileDetails data) =>
    json.encode(data.toJson());

class GetUserProfileDetails {
  GetUserProfileDetails({
    this.user,
    this.message,
    this.code,
  });

  User? user;
  String? message;
  int? code;

  factory GetUserProfileDetails.fromJson(Map<String, dynamic> json) =>
      GetUserProfileDetails(
        user: User.fromJson(json["user"] ?? {}),
        message: json['message'],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "user": user!.toJson(),
      };
}

class User {
  User(
      {this.isDeleted,
      this.role,
      this.isEmailVerified,
      this.name,
      this.email,
      this.id,
      this.status,
      this.isKyc,
      this.storeRegistered,
      });

  bool? isDeleted;
  String? role;
  bool? isEmailVerified;
  String? name;
  String? email;
  String? id;
  String? status;
  bool? isKyc;
  bool? storeRegistered;

  factory User.fromJson(Map<String, dynamic> json) => User(
        isDeleted: json["isDeleted"],
        role: json["role"],
        isEmailVerified: json["isEmailVerified"],
        name: json["name"],
        email: json["email"],
        id: json["id"],
        status: json["status"],
        storeRegistered: json["storeRegistered"],
        isKyc: json["isKyc"],
      );

  Map<String, dynamic> toJson() => {
        "role": role,
        "isEmailVerified": isEmailVerified,
        "name": name,
        "email": email,
        "id": id,
        "status": status,
        "storeRegistered": storeRegistered,
        "isKyc": isKyc,
        "isDeleted": isDeleted,
      };
}
