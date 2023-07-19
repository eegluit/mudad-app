import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.user,
    this.token,
    this.message,
    this.code,
  });

  User? user;
  Token? token;
  String? message;
  int? code;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        user: User.fromJson(json["user"] ?? {}),
        token: Token.fromJson(json["token"] ?? {}) ,
        message: json['message'],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "user": user!.toJson(),
        "token": token!.toJson(),
      };
}

class Token {
  Token({
    this.access,
  });

  Access? access;

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        access: Access.fromJson(json["access"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "access": access!.toJson(),
      };
}

class Access {
  Access({
    this.token,
    this.expires,
  });

  String? token;
  DateTime? expires;

  factory Access.fromJson(Map<String, dynamic> json) => Access(
        token: json["token"],
        expires: DateTime.parse(json["expires"] ?? DateTime.now().toIso8601String()),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "expires": expires!.toIso8601String(),
      };
}

class User {
  User({
    this.role,
    this.isEmailVerified,
    this.name,
    this.email,
    this.isKyc,
    this.id,
    this.profileUrl
  });

  String? role;
  bool? isEmailVerified;
  bool? isKyc;
  String? name;
  String? email;
  String? id;
  String? profileUrl;

  factory User.fromJson(Map<String, dynamic> json) => User(
        role: json["role"],
        isEmailVerified: json["isEmailVerified"],
        name: json["name"],
        email: json["email"],
        id: json["id"],
        isKyc: json["isKyc"],
    profileUrl: json["profile_url"],
      );

  Map<String, dynamic> toJson() => {
        "role": role,
        "isEmailVerified": isEmailVerified,
        "isKyc": isKyc,
        "name": name,
        "email": email,
        "id": id,
        "profile_url": profileUrl,
      };
}
