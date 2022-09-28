class MyScore {
  int? id;
  int? score;
  String? datetime;

  MyScore({this.id, this.score, this.datetime});

  Map<String, dynamic> toJson() {
    return {'id': id, 'score': score, 'datetime': datetime};
  }

  MyScore.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    score = json['score'];
    datetime = json['datetime'];
  }
}
