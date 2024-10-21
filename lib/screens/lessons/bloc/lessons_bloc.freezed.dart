// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lessons_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LessonsState {
  UIStatus get status => throw _privateConstructorUsedError;
  LessonsResponse? get lessonsResponse => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LessonsStateCopyWith<LessonsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonsStateCopyWith<$Res> {
  factory $LessonsStateCopyWith(
          LessonsState value, $Res Function(LessonsState) then) =
      _$LessonsStateCopyWithImpl<$Res, LessonsState>;
  @useResult
  $Res call({UIStatus status, LessonsResponse? lessonsResponse});

  $UIStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$LessonsStateCopyWithImpl<$Res, $Val extends LessonsState>
    implements $LessonsStateCopyWith<$Res> {
  _$LessonsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? lessonsResponse = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UIStatus,
      lessonsResponse: freezed == lessonsResponse
          ? _value.lessonsResponse
          : lessonsResponse // ignore: cast_nullable_to_non_nullable
              as LessonsResponse?,
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
abstract class _$$LessonsStateImplCopyWith<$Res>
    implements $LessonsStateCopyWith<$Res> {
  factory _$$LessonsStateImplCopyWith(
          _$LessonsStateImpl value, $Res Function(_$LessonsStateImpl) then) =
      __$$LessonsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UIStatus status, LessonsResponse? lessonsResponse});

  @override
  $UIStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$LessonsStateImplCopyWithImpl<$Res>
    extends _$LessonsStateCopyWithImpl<$Res, _$LessonsStateImpl>
    implements _$$LessonsStateImplCopyWith<$Res> {
  __$$LessonsStateImplCopyWithImpl(
      _$LessonsStateImpl _value, $Res Function(_$LessonsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? lessonsResponse = freezed,
  }) {
    return _then(_$LessonsStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UIStatus,
      lessonsResponse: freezed == lessonsResponse
          ? _value.lessonsResponse
          : lessonsResponse // ignore: cast_nullable_to_non_nullable
              as LessonsResponse?,
    ));
  }
}

/// @nodoc

class _$LessonsStateImpl implements _LessonsState {
  const _$LessonsStateImpl(
      {this.status = const UIStatus.initial(), this.lessonsResponse});

  @override
  @JsonKey()
  final UIStatus status;
  @override
  final LessonsResponse? lessonsResponse;

  @override
  String toString() {
    return 'LessonsState(status: $status, lessonsResponse: $lessonsResponse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonsStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.lessonsResponse, lessonsResponse) ||
                other.lessonsResponse == lessonsResponse));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, lessonsResponse);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonsStateImplCopyWith<_$LessonsStateImpl> get copyWith =>
      __$$LessonsStateImplCopyWithImpl<_$LessonsStateImpl>(this, _$identity);
}

abstract class _LessonsState implements LessonsState {
  const factory _LessonsState(
      {final UIStatus status,
      final LessonsResponse? lessonsResponse}) = _$LessonsStateImpl;

  @override
  UIStatus get status;
  @override
  LessonsResponse? get lessonsResponse;
  @override
  @JsonKey(ignore: true)
  _$$LessonsStateImplCopyWith<_$LessonsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
