// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_ans_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelectedAnsData _$SelectedAnsDataFromJson(Map<String, dynamic> json) =>
    SelectedAnsData(
      answereColumn: (json['answereColumn'] as num?)?.toInt(),
      selectedAns: json['selectedAns'] as String?,
    );

Map<String, dynamic> _$SelectedAnsDataToJson(SelectedAnsData instance) =>
    <String, dynamic>{
      'answereColumn': instance.answereColumn,
      'selectedAns': instance.selectedAns,
    };
