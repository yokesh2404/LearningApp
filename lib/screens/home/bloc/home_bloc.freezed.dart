// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeBlocState {
  UIStatus get status => throw _privateConstructorUsedError;
  UserDetails? get userDetails => throw _privateConstructorUsedError;
  List<BasicConcept>? get courseList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeBlocStateCopyWith<HomeBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeBlocStateCopyWith<$Res> {
  factory $HomeBlocStateCopyWith(
          HomeBlocState value, $Res Function(HomeBlocState) then) =
      _$HomeBlocStateCopyWithImpl<$Res, HomeBlocState>;
  @useResult
  $Res call(
      {UIStatus status,
      UserDetails? userDetails,
      List<BasicConcept>? courseList});

  $UIStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$HomeBlocStateCopyWithImpl<$Res, $Val extends HomeBlocState>
    implements $HomeBlocStateCopyWith<$Res> {
  _$HomeBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? userDetails = freezed,
    Object? courseList = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UIStatus,
      userDetails: freezed == userDetails
          ? _value.userDetails
          : userDetails // ignore: cast_nullable_to_non_nullable
              as UserDetails?,
      courseList: freezed == courseList
          ? _value.courseList
          : courseList // ignore: cast_nullable_to_non_nullable
              as List<BasicConcept>?,
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
abstract class _$$HomeBlocStateImplCopyWith<$Res>
    implements $HomeBlocStateCopyWith<$Res> {
  factory _$$HomeBlocStateImplCopyWith(
          _$HomeBlocStateImpl value, $Res Function(_$HomeBlocStateImpl) then) =
      __$$HomeBlocStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UIStatus status,
      UserDetails? userDetails,
      List<BasicConcept>? courseList});

  @override
  $UIStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$HomeBlocStateImplCopyWithImpl<$Res>
    extends _$HomeBlocStateCopyWithImpl<$Res, _$HomeBlocStateImpl>
    implements _$$HomeBlocStateImplCopyWith<$Res> {
  __$$HomeBlocStateImplCopyWithImpl(
      _$HomeBlocStateImpl _value, $Res Function(_$HomeBlocStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? userDetails = freezed,
    Object? courseList = freezed,
  }) {
    return _then(_$HomeBlocStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UIStatus,
      userDetails: freezed == userDetails
          ? _value.userDetails
          : userDetails // ignore: cast_nullable_to_non_nullable
              as UserDetails?,
      courseList: freezed == courseList
          ? _value._courseList
          : courseList // ignore: cast_nullable_to_non_nullable
              as List<BasicConcept>?,
    ));
  }
}

/// @nodoc

class _$HomeBlocStateImpl
    with DiagnosticableTreeMixin
    implements _HomeBlocState {
  const _$HomeBlocStateImpl(
      {this.status = const UIInitial(),
      this.userDetails,
      final List<BasicConcept>? courseList})
      : _courseList = courseList;

  @override
  @JsonKey()
  final UIStatus status;
  @override
  final UserDetails? userDetails;
  final List<BasicConcept>? _courseList;
  @override
  List<BasicConcept>? get courseList {
    final value = _courseList;
    if (value == null) return null;
    if (_courseList is EqualUnmodifiableListView) return _courseList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeBlocState(status: $status, userDetails: $userDetails, courseList: $courseList)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomeBlocState'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('userDetails', userDetails))
      ..add(DiagnosticsProperty('courseList', courseList));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeBlocStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.userDetails, userDetails) ||
                other.userDetails == userDetails) &&
            const DeepCollectionEquality()
                .equals(other._courseList, _courseList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, userDetails,
      const DeepCollectionEquality().hash(_courseList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeBlocStateImplCopyWith<_$HomeBlocStateImpl> get copyWith =>
      __$$HomeBlocStateImplCopyWithImpl<_$HomeBlocStateImpl>(this, _$identity);
}

abstract class _HomeBlocState implements HomeBlocState {
  const factory _HomeBlocState(
      {final UIStatus status,
      final UserDetails? userDetails,
      final List<BasicConcept>? courseList}) = _$HomeBlocStateImpl;

  @override
  UIStatus get status;
  @override
  UserDetails? get userDetails;
  @override
  List<BasicConcept>? get courseList;
  @override
  @JsonKey(ignore: true)
  _$$HomeBlocStateImplCopyWith<_$HomeBlocStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
