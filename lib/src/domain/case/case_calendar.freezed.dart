// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'case_calendar.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CaseCalendar _$CaseCalendarFromJson(Map<String, dynamic> json) {
  return _CaseCalendar.fromJson(json);
}

/// @nodoc
mixin _$CaseCalendar {
  @TimestampSerializer()
  DateTime? get startDate => throw _privateConstructorUsedError;
  @TimestampSerializer()
  DateTime? get endDate => throw _privateConstructorUsedError;

  /// Serializes this CaseCalendar to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CaseCalendar
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CaseCalendarCopyWith<CaseCalendar> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CaseCalendarCopyWith<$Res> {
  factory $CaseCalendarCopyWith(
          CaseCalendar value, $Res Function(CaseCalendar) then) =
      _$CaseCalendarCopyWithImpl<$Res, CaseCalendar>;
  @useResult
  $Res call(
      {@TimestampSerializer() DateTime? startDate,
      @TimestampSerializer() DateTime? endDate});
}

/// @nodoc
class _$CaseCalendarCopyWithImpl<$Res, $Val extends CaseCalendar>
    implements $CaseCalendarCopyWith<$Res> {
  _$CaseCalendarCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CaseCalendar
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_value.copyWith(
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CaseCalendarImplCopyWith<$Res>
    implements $CaseCalendarCopyWith<$Res> {
  factory _$$CaseCalendarImplCopyWith(
          _$CaseCalendarImpl value, $Res Function(_$CaseCalendarImpl) then) =
      __$$CaseCalendarImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@TimestampSerializer() DateTime? startDate,
      @TimestampSerializer() DateTime? endDate});
}

/// @nodoc
class __$$CaseCalendarImplCopyWithImpl<$Res>
    extends _$CaseCalendarCopyWithImpl<$Res, _$CaseCalendarImpl>
    implements _$$CaseCalendarImplCopyWith<$Res> {
  __$$CaseCalendarImplCopyWithImpl(
      _$CaseCalendarImpl _value, $Res Function(_$CaseCalendarImpl) _then)
      : super(_value, _then);

  /// Create a copy of CaseCalendar
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_$CaseCalendarImpl(
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CaseCalendarImpl with DiagnosticableTreeMixin implements _CaseCalendar {
  const _$CaseCalendarImpl(
      {@TimestampSerializer() this.startDate,
      @TimestampSerializer() this.endDate});

  factory _$CaseCalendarImpl.fromJson(Map<String, dynamic> json) =>
      _$$CaseCalendarImplFromJson(json);

  @override
  @TimestampSerializer()
  final DateTime? startDate;
  @override
  @TimestampSerializer()
  final DateTime? endDate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CaseCalendar(startDate: $startDate, endDate: $endDate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CaseCalendar'))
      ..add(DiagnosticsProperty('startDate', startDate))
      ..add(DiagnosticsProperty('endDate', endDate));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CaseCalendarImpl &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate);

  /// Create a copy of CaseCalendar
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CaseCalendarImplCopyWith<_$CaseCalendarImpl> get copyWith =>
      __$$CaseCalendarImplCopyWithImpl<_$CaseCalendarImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CaseCalendarImplToJson(
      this,
    );
  }
}

abstract class _CaseCalendar implements CaseCalendar {
  const factory _CaseCalendar(
      {@TimestampSerializer() final DateTime? startDate,
      @TimestampSerializer() final DateTime? endDate}) = _$CaseCalendarImpl;

  factory _CaseCalendar.fromJson(Map<String, dynamic> json) =
      _$CaseCalendarImpl.fromJson;

  @override
  @TimestampSerializer()
  DateTime? get startDate;
  @override
  @TimestampSerializer()
  DateTime? get endDate;

  /// Create a copy of CaseCalendar
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CaseCalendarImplCopyWith<_$CaseCalendarImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
