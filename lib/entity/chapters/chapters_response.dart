// To parse this JSON data, do
//
//     final chaptersResponse = chaptersResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'chapters_response.g.dart';

ChaptersResponse chaptersResponseFromJson(String str) =>
    ChaptersResponse.fromJson(json.decode(str));

String chaptersResponseToJson(ChaptersResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class ChaptersResponse {
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "id")
  final String? id;

  ChaptersResponse({
    this.name,
    this.description,
    this.id,
  });

  ChaptersResponse copyWith({
    String? name,
    String? description,
    String? id,
  }) =>
      ChaptersResponse(
        name: name ?? this.name,
        description: description ?? this.description,
        id: id ?? this.id,
      );

  factory ChaptersResponse.fromJson(Map<String, dynamic> json) =>
      _$ChaptersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChaptersResponseToJson(this);
}
