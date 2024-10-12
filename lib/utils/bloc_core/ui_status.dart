import 'package:freezed_annotation/freezed_annotation.dart';

part 'ui_status.freezed.dart';

@Freezed(fromJson: false, toJson: false)
class UIStatus with _$UIStatus {
  const factory UIStatus.initial() = UIInitial;

  const factory UIStatus.loading() = UILoading;

  const factory UIStatus.loadFailed() = UILoadFailed;

  const factory UIStatus.loadSuccess() = UILoadSuccess;
}
