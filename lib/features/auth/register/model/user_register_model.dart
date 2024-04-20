import 'dart:convert';

User userModelFromJson(String str) => User.fromJson(json.decode(str));

String userModelToJson(User data) => json.encode(data.toJson());

class UserUpModel {
  User user;
  String status;
  String message;

  UserUpModel({
    required this.user,
    required this.status,
    required this.message,
  });
}

class User {
  DateTime emailVerifiedAt;
  String email;
  String code;
  int id;

  User({
    required this.emailVerifiedAt,
    required this.email,
    required this.code,
    required this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
      email: json['email'],
      emailVerifiedAt: json["emailVerifiedAt"],
      code: json['code'],
      id: json["id"]);

  Map<String, dynamic> toJson() => {
        "email": email,
      };
}
