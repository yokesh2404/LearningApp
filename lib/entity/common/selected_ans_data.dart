import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'selected_ans_data.g.dart';

@JsonSerializable()
class SelectedAnsData {
  @JsonKey(name: "answereColumn")
  final int? answereColumn;
  @JsonKey(name: "selectedAns")
  final String? selectedAns;

  SelectedAnsData({
    this.answereColumn,
    this.selectedAns,
  });

  SelectedAnsData copyWith({
    int? answereColumn,
    String? selectedAns,
  }) =>
      SelectedAnsData(
        answereColumn: answereColumn ?? this.answereColumn,
        selectedAns: selectedAns ?? this.selectedAns,
      );

  factory SelectedAnsData.fromJson(Map<String, dynamic> json) =>
      _$SelectedAnsDataFromJson(json);

  Map<String, dynamic> toJson() => _$SelectedAnsDataToJson(this);
}
