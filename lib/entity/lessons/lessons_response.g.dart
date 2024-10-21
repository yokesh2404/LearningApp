// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lessons_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonsResponse _$LessonsResponseFromJson(Map<String, dynamic> json) =>
    LessonsResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => LessonsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LessonsResponseToJson(LessonsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

LessonsData _$LessonsDataFromJson(Map<String, dynamic> json) => LessonsData(
      description: json['description'] as String?,
      video: json['video'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$LessonsDataToJson(LessonsData instance) =>
    <String, dynamic>{
      'description': instance.description,
      'video': instance.video,
      'title': instance.title,
    };
