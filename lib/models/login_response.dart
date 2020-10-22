import 'dart:convert';
import 'package:chat/models/user.dart';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.ok,
    this.token,
    this.user,
  });

  bool ok;
  String token;
  User user;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    ok: json["ok"],
    token: json["token"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "ok": ok,
    "token": token,
    "user": user.toJson(),
  };
}
