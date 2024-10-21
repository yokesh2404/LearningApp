// To parse this JSON data, do
//
//     final lessonsResponse = lessonsResponseFromJson(jsonString);

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'lessons_response.g.dart';

LessonsResponse lessonsResponseFromJson(String str) =>
    LessonsResponse.fromJson(json.decode(str));

String lessonsResponseToJson(LessonsResponse data) =>
    json.encode(data.toJson());

@immutable
@JsonSerializable()
class LessonsResponse {
  @JsonKey(name: "data")
  final List<LessonsData>? data;

  LessonsResponse({
    this.data,
  });

  LessonsResponse copyWith({
    List<LessonsData>? data,
  }) =>
      LessonsResponse(
        data: data ?? this.data,
      );

  factory LessonsResponse.fromJson(Map<String, dynamic> json) =>
      _$LessonsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LessonsResponseToJson(this);
}

@immutable
@JsonSerializable()
class LessonsData {
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "video")
  final String? video;
  @JsonKey(name: "title")
  final String? title;

  LessonsData({
    this.description,
    this.video,
    this.title,
  });

  LessonsData copyWith({
    String? description,
    String? video,
    String? title,
  }) =>
      LessonsData(
        description: description ?? this.description,
        video: video ?? this.video,
        title: title ?? this.title,
      );

  factory LessonsData.fromJson(Map<String, dynamic> json) =>
      _$LessonsDataFromJson(json);

  Map<String, dynamic> toJson() => _$LessonsDataToJson(this);
}
