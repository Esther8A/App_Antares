
import 'dart:convert';

UserTec userTecFromJson(String str) => UserTec.fromJson(json.decode(str));

String userTecToJson(UserTec data) => json.encode(data.toJson());

class UserTec {
  String id;
  String username;
  String email;
  String password;

  UserTec({
    this.id,
    this.username,
    this.email,
    this.password,
  });

  factory UserTec.fromJson(Map<String, dynamic> json) => UserTec(
    id: json["id"],
    username: json["username"],
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "password": password,
  };
}
