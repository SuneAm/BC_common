// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'date_calendar.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DateCalendar _$DateCalendarFromJson(Map<String, dynamic> json) {
  return _DateCalendar.fromJson(json);
}

/// @nodoc
mixin _$DateCalendar {
  @TimestampSerializer()
  DateTime get startDate => throw _privateConstructorUsedError;
  @TimestampSerializer()
  DateTime get endDate => throw _privateConstructorUsedError;
  DateCalendarColor? get color => throw _privateConstructorUsedError;
  double? get progress => throw _privateConstructorUsedError;

  /// Serializes this DateCalendar to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DateCalendar
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DateCalendarCopyWith<DateCalendar> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DateCalendarCopyWith<$Res> {
  factory $DateCalendarCopyWith(
          DateCalendar value, $Res Function(DateCalendar) then) =
      _$DateCalendarCopyWithImpl<$Res, DateCalendar>;
  @useResult
  $Res call(
      {@TimestampSerializer() DateTime startDate,
      @TimestampSerializer() DateTime endDate,
      DateCalendarColor? color,
      double? progress});
}

/// @nodoc
class _$DateCalendarCopyWithImpl<$Res, $Val extends DateCalendar>
    implements $DateCalendarCopyWith<$Res> {
  _$DateCalendarCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DateCalendar
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
    Object? color = freezed,
    Object? progress = freezed,
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
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as DateCalendarColor?,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DateCalendarImplCopyWith<$Res>
    implements $DateCalendarCopyWith<$Res> {
  factory _$$DateCalendarImplCopyWith(
          _$DateCalendarImpl value, $Res Function(_$DateCalendarImpl) then) =
      __$$DateCalendarImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@TimestampSerializer() DateTime startDate,
      @TimestampSerializer() DateTime endDate,
      DateCalendarColor? color,
      double? progress});
}

/// @nodoc
class __$$DateCalendarImplCopyWithImpl<$Res>
    extends _$DateCalendarCopyWithImpl<$Res, _$DateCalendarImpl>
    implements _$$DateCalendarImplCopyWith<$Res> {
  __$$DateCalendarImplCopyWithImpl(
      _$DateCalendarImpl _value, $Res Function(_$DateCalendarImpl) _then)
      : super(_value, _then);

  /// Create a copy of DateCalendar
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
    Object? color = freezed,
    Object? progress = freezed,
  }) {
    return _then(_$DateCalendarImpl(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as DateCalendarColor?,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DateCalendarImpl implements _DateCalendar {
  const _$DateCalendarImpl(
      {@TimestampSerializer() required this.startDate,
      @TimestampSerializer() required this.endDate,
      this.color,
      this.progress});

  factory _$DateCalendarImpl.fromJson(Map<String, dynamic> json) =>
      _$$DateCalendarImplFromJson(json);

  @override
  @TimestampSerializer()
  final DateTime startDate;
  @override
  @TimestampSerializer()
  final DateTime endDate;
  @override
  final DateCalendarColor? color;
  @override
  final double? progress;

  @override
  String toString() {
    return 'DateCalendar(startDate: $startDate, endDate: $endDate, color: $color, progress: $progress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DateCalendarImpl &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, startDate, endDate, color, progress);

  /// Create a copy of DateCalendar
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DateCalendarImplCopyWith<_$DateCalendarImpl> get copyWith =>
      __$$DateCalendarImplCopyWithImpl<_$DateCalendarImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DateCalendarImplToJson(
      this,
    );
  }
}

abstract class _DateCalendar implements DateCalendar {
  const factory _DateCalendar(
      {@TimestampSerializer() required final DateTime startDate,
      @TimestampSerializer() required final DateTime endDate,
      final DateCalendarColor? color,
      final double? progress}) = _$DateCalendarImpl;

  factory _DateCalendar.fromJson(Map<String, dynamic> json) =
      _$DateCalendarImpl.fromJson;

  @override
  @TimestampSerializer()
  DateTime get startDate;
  @override
  @TimestampSerializer()
  DateTime get endDate;
  @override
  DateCalendarColor? get color;
  @override
  double? get progress;

  /// Create a copy of DateCalendar
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DateCalendarImplCopyWith<_$DateCalendarImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
