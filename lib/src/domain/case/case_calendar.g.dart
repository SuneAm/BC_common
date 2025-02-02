// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'case_calendar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CaseCalendarImpl _$$CaseCalendarImplFromJson(Map<String, dynamic> json) =>
    _$CaseCalendarImpl(
      startDate:
          const TimestampSerializer().fromJson(json['startDate'] as Timestamp),
      endDate:
          const TimestampSerializer().fromJson(json['endDate'] as Timestamp),
      calendarColor:
          $enumDecodeNullable(_$CalendarColorEnumMap, json['calendarColor']),
      progress: (json['progress'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$CaseCalendarImplToJson(_$CaseCalendarImpl instance) =>
    <String, dynamic>{
      'startDate': const TimestampSerializer().toJson(instance.startDate),
      'endDate': const TimestampSerializer().toJson(instance.endDate),
      if (_$CalendarColorEnumMap[instance.calendarColor] case final value?)
        'calendarColor': value,
      if (instance.progress case final value?) 'progress': value,
    };

const _$CalendarColorEnumMap = {
  CalendarColor.blue: 'blue',
  CalendarColor.turquoise: 'turquoise',
  CalendarColor.green: 'green',
  CalendarColor.yellow: 'yellow',
  CalendarColor.brown: 'brown',
  CalendarColor.red: 'red',
  CalendarColor.pink: 'pink',
  CalendarColor.marine: 'marine',
  CalendarColor.purple: 'purple',
};
