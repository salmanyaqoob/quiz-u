import 'package:meta/meta.dart';
import 'dart:convert';

TokenResponse tokenResponseFromJson(String str) => TokenResponse.fromJson(json.decode(str));

String tokenResponseToJson(TokenResponse? data) => json.encode(data?.toJson());

class TokenResponse {
  TokenResponse({
    required this.success,
    required this.message,
    this.userStatus,
    this.name,
    this.mobile,
    this.token,
  });

  bool success;
  String message;
  String? userStatus;
  String? name;
  String? mobile;
  String? token;

  factory TokenResponse.fromJson(Map<String, dynamic> json) => TokenResponse(
    success: json["success"],
    message: json["message"],
    userStatus: json["user_status"],
    name: json["name"],
    mobile: json["mobile"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "user_status": userStatus,
    "name": name,
    "mobile": mobile,
    "token": token,
  };
}

