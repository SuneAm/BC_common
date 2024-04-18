// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'case_calendar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CaseCalendarImpl _$$CaseCalendarImplFromJson(Map<String, dynamic> json) =>
    _$CaseCalendarImpl(
      startDate: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['startDate'], const TimestampSerializer().fromJson),
      endDate: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['endDate'], const TimestampSerializer().fromJson),
    );

Map<String, dynamic> _$$CaseCalendarImplToJson(_$CaseCalendarImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'startDate',
      _$JsonConverterToJson<Timestamp, DateTime>(
          instance.startDate, const TimestampSerializer().toJson));
  writeNotNull(
      'endDate',
      _$JsonConverterToJson<Timestamp, DateTime>(
          instance.endDate, const TimestampSerializer().toJson));
  return val;
}

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
