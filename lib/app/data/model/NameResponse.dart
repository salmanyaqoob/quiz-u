import 'dart:convert';

NameResponse nameResponseFromJson(String str) => NameResponse.fromJson(json.decode(str));

String nameResponseToJson(NameResponse data) => json.encode(data.toJson());

class NameResponse {
  NameResponse({
    required this.success,
    required this.message,
    required this.name,
    required this.mobile,
  });

  bool success;
  String message;
  String name;
  String mobile;

  factory NameResponse.fromJson(Map<String, dynamic> json) => NameResponse(
    success: json["success"],
    message: json["message"],
    name: json["name"],
    mobile: json["mobile"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "name": name,
    "mobile": mobile,
  };
}
