import 'dart:convert';

List<TopScores> topScoresFromJson(String str) => List<TopScores>.from(json.decode(str).map((x) => TopScores.fromJson(x)));

String topScoresToJson(List<TopScores> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TopScores {
  TopScores({
    this.name,
    this.score,
  });

  String? name;
  int? score;

  factory TopScores.fromJson(Map<String, dynamic> json) => TopScores(
    name: json["name"] == null ? null : json["name"],
    score: json["score"] == null ? null : json["score"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "score": score == null ? null : score,
  };
}