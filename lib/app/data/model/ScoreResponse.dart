import 'dart:convert';

ScoreResponse scoreResponseFromJson(String str) => ScoreResponse.fromJson(json.decode(str));

String scoreResponseToJson(ScoreResponse data) => json.encode(data.toJson());

class ScoreResponse {
  ScoreResponse({
    required this.success,
    required this.message,
  });

  bool success;
  String message;

  factory ScoreResponse.fromJson(Map<String, dynamic> json) => ScoreResponse(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}