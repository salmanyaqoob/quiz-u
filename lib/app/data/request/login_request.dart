import 'package:meta/meta.dart';
import 'dart:convert';

LoginRequest loginRequestFromJson(String str) => LoginRequest.fromJson(json.decode(str));

String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
  LoginRequest({
    required this.otp,
    required this.mobile,
  });

  String otp;
  String mobile;

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
    otp: json["OTP"],
    mobile: json["mobile"],
  );

  Map<String, dynamic> toJson() => {
    "OTP": otp,
    "mobile": mobile,
  };
}