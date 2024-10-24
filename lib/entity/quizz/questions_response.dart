// To parse this JSON data, do
//
//     final questionsResponse = questionsResponseFromJson(jsonString);

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'questions_response.g.dart';

QuestionsResponse questionsResponseFromJson(String str) =>
    QuestionsResponse.fromJson(json.decode(str));

String questionsResponseToJson(QuestionsResponse data) =>
    json.encode(data.toJson());

@immutable
@JsonSerializable()
class QuestionsResponse {
  @JsonKey(name: "data")
  final List<QuestionsData>? data;

  QuestionsResponse({
    this.data,
  });

  QuestionsResponse copyWith({
    List<QuestionsData>? data,
  }) =>
      QuestionsResponse(
        data: data ?? this.data,
      );

  factory QuestionsResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionsResponseToJson(this);
}

@immutable
@JsonSerializable()
class QuestionsData {
  @JsonKey(name: "question")
  final String? question;
  @JsonKey(name: "answers")
  final List<String>? answers;
  @JsonKey(name: "correct_answer")
  final String? correctAnswere;

  QuestionsData({
    this.question,
    this.answers,
    this.correctAnswere,
  });

  QuestionsData copyWith({
    String? question,
    List<String>? answers,
    String? correctAnswere,
  }) =>
      QuestionsData(
        question: question ?? this.question,
        answers: answers ?? this.answers,
        correctAnswere: correctAnswere ?? this.correctAnswere,
      );

  factory QuestionsData.fromJson(Map<String, dynamic> json) =>
      _$QuestionsDataFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionsDataToJson(this);
}
