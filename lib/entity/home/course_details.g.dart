// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseDetails _$CourseDetailsFromJson(Map<String, dynamic> json) =>
    CourseDetails(
      basicConcept: json['basicConcept'] == null
          ? null
          : BasicConcept.fromJson(json['basicConcept'] as Map<String, dynamic>),
      cbscSyllabus: json['cbscSyllabus'] == null
          ? null
          : BasicConcept.fromJson(json['cbscSyllabus'] as Map<String, dynamic>),
      tamilnaduStateBoard: json['tamilnaduStateBoard'] == null
          ? null
          : BasicConcept.fromJson(
              json['tamilnaduStateBoard'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CourseDetailsToJson(CourseDetails instance) =>
    <String, dynamic>{
      'basicConcept': instance.basicConcept,
      'cbscSyllabus': instance.cbscSyllabus,
      'tamilnaduStateBoard': instance.tamilnaduStateBoard,
    };

BasicConcept _$BasicConceptFromJson(Map<String, dynamic> json) => BasicConcept(
      isAvailable: json['isAvailable'] as bool?,
      title: json['title'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$BasicConceptToJson(BasicConcept instance) =>
    <String, dynamic>{
      'isAvailable': instance.isAvailable,
      'title': instance.title,
      'id': instance.id,
    };
