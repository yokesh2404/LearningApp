// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chapters_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChaptersState {
  UIStatus get status => throw _privateConstructorUsedError;
  List<ChaptersResponse> get chapters => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChaptersStateCopyWith<ChaptersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChaptersStateCopyWith<$Res> {
  factory $ChaptersStateCopyWith(
          ChaptersState value, $Res Function(ChaptersState) then) =
      _$ChaptersStateCopyWithImpl<$Res, ChaptersState>;
  @useResult
  $Res call({UIStatus status, List<ChaptersResponse> chapters});

  $UIStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$ChaptersStateCopyWithImpl<$Res, $Val extends ChaptersState>
    implements $ChaptersStateCopyWith<$Res> {
  _$ChaptersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? chapters = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UIStatus,
      chapters: null == chapters
          ? _value.chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as List<ChaptersResponse>,
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
abstract class _$$ChaptersStateImplCopyWith<$Res>
    implements $ChaptersStateCopyWith<$Res> {
  factory _$$ChaptersStateImplCopyWith(
          _$ChaptersStateImpl value, $Res Function(_$ChaptersStateImpl) then) =
      __$$ChaptersStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UIStatus status, List<ChaptersResponse> chapters});

  @override
  $UIStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$ChaptersStateImplCopyWithImpl<$Res>
    extends _$ChaptersStateCopyWithImpl<$Res, _$ChaptersStateImpl>
    implements _$$ChaptersStateImplCopyWith<$Res> {
  __$$ChaptersStateImplCopyWithImpl(
      _$ChaptersStateImpl _value, $Res Function(_$ChaptersStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? chapters = null,
  }) {
    return _then(_$ChaptersStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UIStatus,
      chapters: null == chapters
          ? _value._chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as List<ChaptersResponse>,
    ));
  }
}

/// @nodoc

class _$ChaptersStateImpl implements _ChaptersState {
  const _$ChaptersStateImpl(
      {this.status = const UIInitial(),
      final List<ChaptersResponse> chapters = const []})
      : _chapters = chapters;

  @override
  @JsonKey()
  final UIStatus status;
  final List<ChaptersResponse> _chapters;
  @override
  @JsonKey()
  List<ChaptersResponse> get chapters {
    if (_chapters is EqualUnmodifiableListView) return _chapters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chapters);
  }

  @override
  String toString() {
    return 'ChaptersState(status: $status, chapters: $chapters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChaptersStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._chapters, _chapters));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_chapters));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChaptersStateImplCopyWith<_$ChaptersStateImpl> get copyWith =>
      __$$ChaptersStateImplCopyWithImpl<_$ChaptersStateImpl>(this, _$identity);
}

abstract class _ChaptersState implements ChaptersState {
  const factory _ChaptersState(
      {final UIStatus status,
      final List<ChaptersResponse> chapters}) = _$ChaptersStateImpl;

  @override
  UIStatus get status;
  @override
  List<ChaptersResponse> get chapters;
  @override
  @JsonKey(ignore: true)
  _$$ChaptersStateImplCopyWith<_$ChaptersStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
