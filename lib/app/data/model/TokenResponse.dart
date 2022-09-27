import 'package:meta/meta.dart';
import 'dart:convert';

TokenResponse tokenResponseFromJson(String str) => TokenResponse.fromJson(json.decode(str));

String tokenResponseToJson(TokenResponse? data) => json.encode(data?.toJson());

class TokenResponse {
  TokenResponse({
    required this.success,
    required this.message,
  });

  bool success;
  String message;

  factory TokenResponse.fromJson(Map<String, dynamic> json) => TokenResponse(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}

