import 'package:meta/meta.dart';
import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    required this.success,
    this.userStatus,
    this.name,
    this.mobile,
    required this.message,
    required this.token,
  });

  bool success;
  String? userStatus;
  String? name;
  String? mobile;
  String message;
  String? token;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    success: json["success"],
    userStatus: json["user_status"],
    name: json["name"],
    mobile: json["mobile"],
    message: json["message"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "user_status": userStatus,
    "name": name,
    "mobile": mobile,
    "message": message,
    "token": token,
  };
}

