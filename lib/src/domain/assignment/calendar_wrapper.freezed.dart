// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_wrapper.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CalendarWrapper {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Case c) job,
    required TResult Function(Assignment a) assignment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Case c)? job,
    TResult? Function(Assignment a)? assignment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Case c)? job,
    TResult Function(Assignment a)? assignment,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JobCalendarWrapper value) job,
    required TResult Function(_AssignmentCalendarWrapper value) assignment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_JobCalendarWrapper value)? job,
    TResult? Function(_AssignmentCalendarWrapper value)? assignment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JobCalendarWrapper value)? job,
    TResult Function(_AssignmentCalendarWrapper value)? assignment,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarWrapperCopyWith<$Res> {
  factory $CalendarWrapperCopyWith(
          CalendarWrapper value, $Res Function(CalendarWrapper) then) =
      _$CalendarWrapperCopyWithImpl<$Res, CalendarWrapper>;
}

/// @nodoc
class _$CalendarWrapperCopyWithImpl<$Res, $Val extends CalendarWrapper>
    implements $CalendarWrapperCopyWith<$Res> {
  _$CalendarWrapperCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CalendarWrapper
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$JobCalendarWrapperImplCopyWith<$Res> {
  factory _$$JobCalendarWrapperImplCopyWith(_$JobCalendarWrapperImpl value,
          $Res Function(_$JobCalendarWrapperImpl) then) =
      __$$JobCalendarWrapperImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Case c});
}

/// @nodoc
class __$$JobCalendarWrapperImplCopyWithImpl<$Res>
    extends _$CalendarWrapperCopyWithImpl<$Res, _$JobCalendarWrapperImpl>
    implements _$$JobCalendarWrapperImplCopyWith<$Res> {
  __$$JobCalendarWrapperImplCopyWithImpl(_$JobCalendarWrapperImpl _value,
      $Res Function(_$JobCalendarWrapperImpl) _then)
      : super(_value, _then);

  /// Create a copy of CalendarWrapper
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? c = null,
  }) {
    return _then(_$JobCalendarWrapperImpl(
      null == c
          ? _value.c
          : c // ignore: cast_nullable_to_non_nullable
              as Case,
    ));
  }
}

/// @nodoc

class _$JobCalendarWrapperImpl
    with DiagnosticableTreeMixin
    implements _JobCalendarWrapper {
  const _$JobCalendarWrapperImpl(this.c);

  @override
  final Case c;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CalendarWrapper.job(c: $c)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CalendarWrapper.job'))
      ..add(DiagnosticsProperty('c', c));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobCalendarWrapperImpl &&
            (identical(other.c, c) || other.c == c));
  }

  @override
  int get hashCode => Object.hash(runtimeType, c);

  /// Create a copy of CalendarWrapper
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JobCalendarWrapperImplCopyWith<_$JobCalendarWrapperImpl> get copyWith =>
      __$$JobCalendarWrapperImplCopyWithImpl<_$JobCalendarWrapperImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Case c) job,
    required TResult Function(Assignment a) assignment,
  }) {
    return job(c);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Case c)? job,
    TResult? Function(Assignment a)? assignment,
  }) {
    return job?.call(c);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Case c)? job,
    TResult Function(Assignment a)? assignment,
    required TResult orElse(),
  }) {
    if (job != null) {
      return job(c);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JobCalendarWrapper value) job,
    required TResult Function(_AssignmentCalendarWrapper value) assignment,
  }) {
    return job(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_JobCalendarWrapper value)? job,
    TResult? Function(_AssignmentCalendarWrapper value)? assignment,
  }) {
    return job?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JobCalendarWrapper value)? job,
    TResult Function(_AssignmentCalendarWrapper value)? assignment,
    required TResult orElse(),
  }) {
    if (job != null) {
      return job(this);
    }
    return orElse();
  }
}

abstract class _JobCalendarWrapper implements CalendarWrapper {
  const factory _JobCalendarWrapper(final Case c) = _$JobCalendarWrapperImpl;

  Case get c;

  /// Create a copy of CalendarWrapper
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JobCalendarWrapperImplCopyWith<_$JobCalendarWrapperImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AssignmentCalendarWrapperImplCopyWith<$Res> {
  factory _$$AssignmentCalendarWrapperImplCopyWith(
          _$AssignmentCalendarWrapperImpl value,
          $Res Function(_$AssignmentCalendarWrapperImpl) then) =
      __$$AssignmentCalendarWrapperImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Assignment a});

  $AssignmentCopyWith<$Res> get a;
}

/// @nodoc
class __$$AssignmentCalendarWrapperImplCopyWithImpl<$Res>
    extends _$CalendarWrapperCopyWithImpl<$Res, _$AssignmentCalendarWrapperImpl>
    implements _$$AssignmentCalendarWrapperImplCopyWith<$Res> {
  __$$AssignmentCalendarWrapperImplCopyWithImpl(
      _$AssignmentCalendarWrapperImpl _value,
      $Res Function(_$AssignmentCalendarWrapperImpl) _then)
      : super(_value, _then);

  /// Create a copy of CalendarWrapper
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? a = null,
  }) {
    return _then(_$AssignmentCalendarWrapperImpl(
      null == a
          ? _value.a
          : a // ignore: cast_nullable_to_non_nullable
              as Assignment,
    ));
  }

  /// Create a copy of CalendarWrapper
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AssignmentCopyWith<$Res> get a {
    return $AssignmentCopyWith<$Res>(_value.a, (value) {
      return _then(_value.copyWith(a: value));
    });
  }
}

/// @nodoc

class _$AssignmentCalendarWrapperImpl
    with DiagnosticableTreeMixin
    implements _AssignmentCalendarWrapper {
  const _$AssignmentCalendarWrapperImpl(this.a);

  @override
  final Assignment a;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CalendarWrapper.assignment(a: $a)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CalendarWrapper.assignment'))
      ..add(DiagnosticsProperty('a', a));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssignmentCalendarWrapperImpl &&
            (identical(other.a, a) || other.a == a));
  }

  @override
  int get hashCode => Object.hash(runtimeType, a);

  /// Create a copy of CalendarWrapper
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssignmentCalendarWrapperImplCopyWith<_$AssignmentCalendarWrapperImpl>
      get copyWith => __$$AssignmentCalendarWrapperImplCopyWithImpl<
          _$AssignmentCalendarWrapperImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Case c) job,
    required TResult Function(Assignment a) assignment,
  }) {
    return assignment(a);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Case c)? job,
    TResult? Function(Assignment a)? assignment,
  }) {
    return assignment?.call(a);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Case c)? job,
    TResult Function(Assignment a)? assignment,
    required TResult orElse(),
  }) {
    if (assignment != null) {
      return assignment(a);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JobCalendarWrapper value) job,
    required TResult Function(_AssignmentCalendarWrapper value) assignment,
  }) {
    return assignment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_JobCalendarWrapper value)? job,
    TResult? Function(_AssignmentCalendarWrapper value)? assignment,
  }) {
    return assignment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JobCalendarWrapper value)? job,
    TResult Function(_AssignmentCalendarWrapper value)? assignment,
    required TResult orElse(),
  }) {
    if (assignment != null) {
      return assignment(this);
    }
    return orElse();
  }
}

abstract class _AssignmentCalendarWrapper implements CalendarWrapper {
  const factory _AssignmentCalendarWrapper(final Assignment a) =
      _$AssignmentCalendarWrapperImpl;

  Assignment get a;

  /// Create a copy of CalendarWrapper
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssignmentCalendarWrapperImplCopyWith<_$AssignmentCalendarWrapperImpl>
      get copyWith => throw _privateConstructorUsedError;
}
