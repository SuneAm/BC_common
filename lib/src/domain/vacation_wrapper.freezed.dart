// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vacation_wrapper.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VacationWrapper {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Holiday holiday) holiday,
    required TResult Function(Vacation vacation) vacation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Holiday holiday)? holiday,
    TResult? Function(Vacation vacation)? vacation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Holiday holiday)? holiday,
    TResult Function(Vacation vacation)? vacation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HolidayVacationWrapper value) holiday,
    required TResult Function(_VacationVacationWrapper value) vacation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HolidayVacationWrapper value)? holiday,
    TResult? Function(_VacationVacationWrapper value)? vacation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HolidayVacationWrapper value)? holiday,
    TResult Function(_VacationVacationWrapper value)? vacation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VacationWrapperCopyWith<$Res> {
  factory $VacationWrapperCopyWith(
          VacationWrapper value, $Res Function(VacationWrapper) then) =
      _$VacationWrapperCopyWithImpl<$Res, VacationWrapper>;
}

/// @nodoc
class _$VacationWrapperCopyWithImpl<$Res, $Val extends VacationWrapper>
    implements $VacationWrapperCopyWith<$Res> {
  _$VacationWrapperCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VacationWrapper
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$HolidayVacationWrapperImplCopyWith<$Res> {
  factory _$$HolidayVacationWrapperImplCopyWith(
          _$HolidayVacationWrapperImpl value,
          $Res Function(_$HolidayVacationWrapperImpl) then) =
      __$$HolidayVacationWrapperImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Holiday holiday});

  $HolidayCopyWith<$Res> get holiday;
}

/// @nodoc
class __$$HolidayVacationWrapperImplCopyWithImpl<$Res>
    extends _$VacationWrapperCopyWithImpl<$Res, _$HolidayVacationWrapperImpl>
    implements _$$HolidayVacationWrapperImplCopyWith<$Res> {
  __$$HolidayVacationWrapperImplCopyWithImpl(
      _$HolidayVacationWrapperImpl _value,
      $Res Function(_$HolidayVacationWrapperImpl) _then)
      : super(_value, _then);

  /// Create a copy of VacationWrapper
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? holiday = null,
  }) {
    return _then(_$HolidayVacationWrapperImpl(
      null == holiday
          ? _value.holiday
          : holiday // ignore: cast_nullable_to_non_nullable
              as Holiday,
    ));
  }

  /// Create a copy of VacationWrapper
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HolidayCopyWith<$Res> get holiday {
    return $HolidayCopyWith<$Res>(_value.holiday, (value) {
      return _then(_value.copyWith(holiday: value));
    });
  }
}

/// @nodoc

class _$HolidayVacationWrapperImpl implements _HolidayVacationWrapper {
  const _$HolidayVacationWrapperImpl(this.holiday);

  @override
  final Holiday holiday;

  @override
  String toString() {
    return 'VacationWrapper.holiday(holiday: $holiday)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HolidayVacationWrapperImpl &&
            (identical(other.holiday, holiday) || other.holiday == holiday));
  }

  @override
  int get hashCode => Object.hash(runtimeType, holiday);

  /// Create a copy of VacationWrapper
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HolidayVacationWrapperImplCopyWith<_$HolidayVacationWrapperImpl>
      get copyWith => __$$HolidayVacationWrapperImplCopyWithImpl<
          _$HolidayVacationWrapperImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Holiday holiday) holiday,
    required TResult Function(Vacation vacation) vacation,
  }) {
    return holiday(this.holiday);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Holiday holiday)? holiday,
    TResult? Function(Vacation vacation)? vacation,
  }) {
    return holiday?.call(this.holiday);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Holiday holiday)? holiday,
    TResult Function(Vacation vacation)? vacation,
    required TResult orElse(),
  }) {
    if (holiday != null) {
      return holiday(this.holiday);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HolidayVacationWrapper value) holiday,
    required TResult Function(_VacationVacationWrapper value) vacation,
  }) {
    return holiday(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HolidayVacationWrapper value)? holiday,
    TResult? Function(_VacationVacationWrapper value)? vacation,
  }) {
    return holiday?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HolidayVacationWrapper value)? holiday,
    TResult Function(_VacationVacationWrapper value)? vacation,
    required TResult orElse(),
  }) {
    if (holiday != null) {
      return holiday(this);
    }
    return orElse();
  }
}

abstract class _HolidayVacationWrapper implements VacationWrapper {
  const factory _HolidayVacationWrapper(final Holiday holiday) =
      _$HolidayVacationWrapperImpl;

  Holiday get holiday;

  /// Create a copy of VacationWrapper
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HolidayVacationWrapperImplCopyWith<_$HolidayVacationWrapperImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VacationVacationWrapperImplCopyWith<$Res> {
  factory _$$VacationVacationWrapperImplCopyWith(
          _$VacationVacationWrapperImpl value,
          $Res Function(_$VacationVacationWrapperImpl) then) =
      __$$VacationVacationWrapperImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Vacation vacation});

  $VacationCopyWith<$Res> get vacation;
}

/// @nodoc
class __$$VacationVacationWrapperImplCopyWithImpl<$Res>
    extends _$VacationWrapperCopyWithImpl<$Res, _$VacationVacationWrapperImpl>
    implements _$$VacationVacationWrapperImplCopyWith<$Res> {
  __$$VacationVacationWrapperImplCopyWithImpl(
      _$VacationVacationWrapperImpl _value,
      $Res Function(_$VacationVacationWrapperImpl) _then)
      : super(_value, _then);

  /// Create a copy of VacationWrapper
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vacation = null,
  }) {
    return _then(_$VacationVacationWrapperImpl(
      null == vacation
          ? _value.vacation
          : vacation // ignore: cast_nullable_to_non_nullable
              as Vacation,
    ));
  }

  /// Create a copy of VacationWrapper
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VacationCopyWith<$Res> get vacation {
    return $VacationCopyWith<$Res>(_value.vacation, (value) {
      return _then(_value.copyWith(vacation: value));
    });
  }
}

/// @nodoc

class _$VacationVacationWrapperImpl implements _VacationVacationWrapper {
  const _$VacationVacationWrapperImpl(this.vacation);

  @override
  final Vacation vacation;

  @override
  String toString() {
    return 'VacationWrapper.vacation(vacation: $vacation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VacationVacationWrapperImpl &&
            (identical(other.vacation, vacation) ||
                other.vacation == vacation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vacation);

  /// Create a copy of VacationWrapper
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VacationVacationWrapperImplCopyWith<_$VacationVacationWrapperImpl>
      get copyWith => __$$VacationVacationWrapperImplCopyWithImpl<
          _$VacationVacationWrapperImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Holiday holiday) holiday,
    required TResult Function(Vacation vacation) vacation,
  }) {
    return vacation(this.vacation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Holiday holiday)? holiday,
    TResult? Function(Vacation vacation)? vacation,
  }) {
    return vacation?.call(this.vacation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Holiday holiday)? holiday,
    TResult Function(Vacation vacation)? vacation,
    required TResult orElse(),
  }) {
    if (vacation != null) {
      return vacation(this.vacation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HolidayVacationWrapper value) holiday,
    required TResult Function(_VacationVacationWrapper value) vacation,
  }) {
    return vacation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HolidayVacationWrapper value)? holiday,
    TResult? Function(_VacationVacationWrapper value)? vacation,
  }) {
    return vacation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HolidayVacationWrapper value)? holiday,
    TResult Function(_VacationVacationWrapper value)? vacation,
    required TResult orElse(),
  }) {
    if (vacation != null) {
      return vacation(this);
    }
    return orElse();
  }
}

abstract class _VacationVacationWrapper implements VacationWrapper {
  const factory _VacationVacationWrapper(final Vacation vacation) =
      _$VacationVacationWrapperImpl;

  Vacation get vacation;

  /// Create a copy of VacationWrapper
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VacationVacationWrapperImplCopyWith<_$VacationVacationWrapperImpl>
      get copyWith => throw _privateConstructorUsedError;
}
