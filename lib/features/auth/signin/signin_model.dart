import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? email;
  String? password;
  String? fcm_token;

  UserModel({
    this.email,
    this.password,
    this.fcm_token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json["email"],
        password: json["password"],
        fcm_token: json["fcm_token"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "fcm_token": fcm_token,
      };
}
