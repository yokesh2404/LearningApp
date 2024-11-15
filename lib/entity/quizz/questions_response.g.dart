// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionsResponse _$QuestionsResponseFromJson(Map<String, dynamic> json) =>
    QuestionsResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => QuestionsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionsResponseToJson(QuestionsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

QuestionsData _$QuestionsDataFromJson(Map<String, dynamic> json) =>
    QuestionsData(
      question: json['question'] as String?,
      answers: (json['answers'] as List<dynamic>?)
          ?.map((e) => AnswersData.fromJson(e as Map<String, dynamic>))
          .toList(),
      correctAnswere: json['correct_answer'] as String?,
      imageUrl: json['imageUrl'] as String?,
      separationNeeded: json['separationNeeded'] as bool?,
    );

Map<String, dynamic> _$QuestionsDataToJson(QuestionsData instance) =>
    <String, dynamic>{
      'question': instance.question,
      'answers': instance.answers,
      'correct_answer': instance.correctAnswere,
      'imageUrl': instance.imageUrl,
      'separationNeeded': instance.separationNeeded,
    };

AnswersData _$AnswersDataFromJson(Map<String, dynamic> json) => AnswersData(
      data: (json['data'] as List<dynamic>?)?.map((e) => e as String).toList(),
      correctAnswer: json['correct_answer'] as String?,
    );

Map<String, dynamic> _$AnswersDataToJson(AnswersData instance) =>
    <String, dynamic>{
      'data': instance.data,
      'correct_answer': instance.correctAnswer,
    };
