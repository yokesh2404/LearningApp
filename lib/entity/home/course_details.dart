// To parse this JSON data, do
//
//     final courseDetails = courseDetailsFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'course_details.g.dart';

List<CourseDetails> courseDetailsFromJson(String str) =>
    List<CourseDetails>.from(
        json.decode(str).map((x) => CourseDetails.fromJson(x)));

String courseDetailsToJson(List<CourseDetails> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class CourseDetails {
  @JsonKey(name: "basicConcept")
  final BasicConcept? basicConcept;
  @JsonKey(name: "cbscSyllabus")
  final BasicConcept? cbscSyllabus;
  @JsonKey(name: "tamilnaduStateBoard")
  final BasicConcept? tamilnaduStateBoard;

  CourseDetails({
    this.basicConcept,
    this.cbscSyllabus,
    this.tamilnaduStateBoard,
  });

  CourseDetails copyWith({
    BasicConcept? basicConcept,
    BasicConcept? cbscSyllabus,
    BasicConcept? tamilnaduStateBoard,
  }) =>
      CourseDetails(
        basicConcept: basicConcept ?? this.basicConcept,
        cbscSyllabus: cbscSyllabus ?? this.cbscSyllabus,
        tamilnaduStateBoard: tamilnaduStateBoard ?? this.tamilnaduStateBoard,
      );

  factory CourseDetails.fromJson(Map<String, dynamic> json) =>
      _$CourseDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$CourseDetailsToJson(this);
}

@JsonSerializable()
class BasicConcept {
  @JsonKey(name: "isAvailable")
  final bool? isAvailable;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "id")
  final String? id;

  BasicConcept({this.isAvailable, this.title, this.id});

  BasicConcept copyWith({bool? isAvailable, String? title, String? id}) =>
      BasicConcept(
          isAvailable: isAvailable ?? this.isAvailable,
          title: title ?? this.title,
          id: id ?? this.id);

  factory BasicConcept.fromJson(Map<String, dynamic> json) =>
      _$BasicConceptFromJson(json);

  Map<String, dynamic> toJson() => _$BasicConceptToJson(this);
}
