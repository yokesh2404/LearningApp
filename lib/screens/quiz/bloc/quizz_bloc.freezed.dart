// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quizz_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$QuizzState {
  UIStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuizzStateCopyWith<QuizzState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizzStateCopyWith<$Res> {
  factory $QuizzStateCopyWith(
          QuizzState value, $Res Function(QuizzState) then) =
      _$QuizzStateCopyWithImpl<$Res, QuizzState>;
  @useResult
  $Res call({UIStatus status});

  $UIStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$QuizzStateCopyWithImpl<$Res, $Val extends QuizzState>
    implements $QuizzStateCopyWith<$Res> {
  _$QuizzStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UIStatus,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UIStatusCopyWith<$Res> get status {
    return $UIStatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QuizzStateImplCopyWith<$Res>
    implements $QuizzStateCopyWith<$Res> {
  factory _$$QuizzStateImplCopyWith(
          _$QuizzStateImpl value, $Res Function(_$QuizzStateImpl) then) =
      __$$QuizzStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UIStatus status});

  @override
  $UIStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$QuizzStateImplCopyWithImpl<$Res>
    extends _$QuizzStateCopyWithImpl<$Res, _$QuizzStateImpl>
    implements _$$QuizzStateImplCopyWith<$Res> {
  __$$QuizzStateImplCopyWithImpl(
      _$QuizzStateImpl _value, $Res Function(_$QuizzStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$QuizzStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UIStatus,
    ));
  }
}

/// @nodoc

class _$QuizzStateImpl implements _QuizzState {
  const _$QuizzStateImpl({this.status = const UIStatus.initial()});

  @override
  @JsonKey()
  final UIStatus status;

  @override
  String toString() {
    return 'QuizzState(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizzStateImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizzStateImplCopyWith<_$QuizzStateImpl> get copyWith =>
      __$$QuizzStateImplCopyWithImpl<_$QuizzStateImpl>(this, _$identity);
}

abstract class _QuizzState implements QuizzState {
  const factory _QuizzState({final UIStatus status}) = _$QuizzStateImpl;

  @override
  UIStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$QuizzStateImplCopyWith<_$QuizzStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
