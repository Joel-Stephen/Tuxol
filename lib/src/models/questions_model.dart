// To parse this JSON data, do
//
//     final questionsModel = questionsModelFromJson(jsonString);

import 'dart:convert';

QuestionsModel questionsModelFromJson(String str) => QuestionsModel.fromJson(json.decode(str));

String questionsModelToJson(QuestionsModel data) => json.encode(data.toJson());

class QuestionsModel {
  QuestionsModel({
    this.responseCode,
    this.results,
  });

  final int responseCode;
  final List<Result> results;

  factory QuestionsModel.fromJson(Map<String, dynamic> json) => QuestionsModel(
    responseCode: json["response_code"] == null ? null : json["response_code"],
    results: json["results"] == null ? null : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "response_code": responseCode == null ? null : responseCode,
    "results": results == null ? null : List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.category,
    this.type,
    this.difficulty,
    this.question,
    this.correctAnswer,
    this.incorrectAnswers,
  });

  final String category;
  final Type type;
  final Difficulty difficulty;
  final String question;
  final String correctAnswer;
  final List<String> incorrectAnswers;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    category: json["category"] == null ? null : json["category"],
    type: json["type"] == null ? null : typeValues.map[json["type"]],
    difficulty: json["difficulty"] == null ? null : difficultyValues.map[json["difficulty"]],
    question: json["question"] == null ? null : json["question"],
    correctAnswer: json["correct_answer"] == null ? null : json["correct_answer"],
    incorrectAnswers: json["incorrect_answers"] == null ? null : List<String>.from(json["incorrect_answers"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "category": category == null ? null : category,
    "type": type == null ? null : typeValues.reverse[type],
    "difficulty": difficulty == null ? null : difficultyValues.reverse[difficulty],
    "question": question == null ? null : question,
    "correct_answer": correctAnswer == null ? null : correctAnswer,
    "incorrect_answers": incorrectAnswers == null ? null : List<dynamic>.from(incorrectAnswers.map((x) => x)),
  };
}

enum Difficulty { MEDIUM, EASY, HARD }

final difficultyValues = EnumValues({
  "easy": Difficulty.EASY,
  "hard": Difficulty.HARD,
  "medium": Difficulty.MEDIUM
});

enum Type { MULTIPLE, BOOLEAN }

final typeValues = EnumValues({
  "boolean": Type.BOOLEAN,
  "multiple": Type.MULTIPLE
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
