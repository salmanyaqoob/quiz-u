import 'dart:convert';

import 'package:flutter/cupertino.dart';

List<QuizQuestion> quizQuestionFromJson(String str) => List<QuizQuestion>.from(json.decode(str).map((x) => QuizQuestion.fromJson(x)));

String quizQuestionToJson(List<QuizQuestion> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuizQuestion {
  QuizQuestion({
    this.question,
    this.a,
    this.b,
    this.c,
    this.d,
    this.correct,
  });

  String? question;
  String? a;
  String? b;
  String? c;
  String? d;
  String? correct;

  factory QuizQuestion.fromJson(Map<String, dynamic> json) => QuizQuestion(
    question: json["Question"],
    a: json["a"],
    b: json["b"],
    c: json["c"],
    d: json["d"],
    correct: json["correct"],
  );

  Map<String, dynamic> toJson() => {
    "Question": question,
    "a": a,
    "b": b,
    "c": c,
    "d": d,
    "correct": correctValues.map[correct],
  };
}

enum Correct { B, D, C, A }

final correctValues = EnumValues({
  "a": Correct.A,
  "b": Correct.B,
  "c": Correct.C,
  "d": Correct.D
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap=null;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
