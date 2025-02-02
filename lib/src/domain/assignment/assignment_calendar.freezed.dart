// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assignment_calendar.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AssignmentCalendar _$AssignmentCalendarFromJson(Map<String, dynamic> json) {
  return _AssignmentCalendar.fromJson(json);
}

/// @nodoc
mixin _$AssignmentCalendar {
  @TimestampSerializer()
  DateTime get startDate => throw _privateConstructorUsedError;
  @TimestampSerializer()
  DateTime get endDate => throw _privateConstructorUsedError;

  /// Serializes this AssignmentCalendar to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AssignmentCalendar
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssignmentCalendarCopyWith<AssignmentCalendar> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssignmentCalendarCopyWith<$Res> {
  factory $AssignmentCalendarCopyWith(
          AssignmentCalendar value, $Res Function(AssignmentCalendar) then) =
      _$AssignmentCalendarCopyWithImpl<$Res, AssignmentCalendar>;
  @useResult
  $Res call(
      {@TimestampSerializer() DateTime startDate,
      @TimestampSerializer() DateTime endDate});
}

/// @nodoc
class _$AssignmentCalendarCopyWithImpl<$Res, $Val extends AssignmentCalendar>
    implements $AssignmentCalendarCopyWith<$Res> {
  _$AssignmentCalendarCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AssignmentCalendar
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_value.copyWith(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssignmentCalendarImplCopyWith<$Res>
    implements $AssignmentCalendarCopyWith<$Res> {
  factory _$$AssignmentCalendarImplCopyWith(_$AssignmentCalendarImpl value,
          $Res Function(_$AssignmentCalendarImpl) then) =
      __$$AssignmentCalendarImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@TimestampSerializer() DateTime startDate,
      @TimestampSerializer() DateTime endDate});
}

/// @nodoc
class __$$AssignmentCalendarImplCopyWithImpl<$Res>
    extends _$AssignmentCalendarCopyWithImpl<$Res, _$AssignmentCalendarImpl>
    implements _$$AssignmentCalendarImplCopyWith<$Res> {
  __$$AssignmentCalendarImplCopyWithImpl(_$AssignmentCalendarImpl _value,
      $Res Function(_$AssignmentCalendarImpl) _then)
      : super(_value, _then);

  /// Create a copy of AssignmentCalendar
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_$AssignmentCalendarImpl(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssignmentCalendarImpl implements _AssignmentCalendar {
  const _$AssignmentCalendarImpl(
      {@TimestampSerializer() required this.startDate,
      @TimestampSerializer() required this.endDate});

  factory _$AssignmentCalendarImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssignmentCalendarImplFromJson(json);

  @override
  @TimestampSerializer()
  final DateTime startDate;
  @override
  @TimestampSerializer()
  final DateTime endDate;

  @override
  String toString() {
    return 'AssignmentCalendar(startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssignmentCalendarImpl &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate);

  /// Create a copy of AssignmentCalendar
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssignmentCalendarImplCopyWith<_$AssignmentCalendarImpl> get copyWith =>
      __$$AssignmentCalendarImplCopyWithImpl<_$AssignmentCalendarImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssignmentCalendarImplToJson(
      this,
    );
  }
}

abstract class _AssignmentCalendar implements AssignmentCalendar {
  const factory _AssignmentCalendar(
          {@TimestampSerializer() required final DateTime startDate,
          @TimestampSerializer() required final DateTime endDate}) =
      _$AssignmentCalendarImpl;

  factory _AssignmentCalendar.fromJson(Map<String, dynamic> json) =
      _$AssignmentCalendarImpl.fromJson;

  @override
  @TimestampSerializer()
  DateTime get startDate;
  @override
  @TimestampSerializer()
  DateTime get endDate;

  /// Create a copy of AssignmentCalendar
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssignmentCalendarImplCopyWith<_$AssignmentCalendarImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
