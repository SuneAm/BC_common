// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_calendar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DateCalendarImpl _$$DateCalendarImplFromJson(Map<String, dynamic> json) =>
    _$DateCalendarImpl(
      startDate:
          const TimestampSerializer().fromJson(json['startDate'] as Timestamp),
      endDate:
          const TimestampSerializer().fromJson(json['endDate'] as Timestamp),
      color: $enumDecodeNullable(_$DateCalendarColorEnumMap, json['color']),
      progress: (json['progress'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$DateCalendarImplToJson(_$DateCalendarImpl instance) =>
    <String, dynamic>{
      'startDate': const TimestampSerializer().toJson(instance.startDate),
      'endDate': const TimestampSerializer().toJson(instance.endDate),
      if (_$DateCalendarColorEnumMap[instance.color] case final value?)
        'color': value,
      if (instance.progress case final value?) 'progress': value,
    };

const _$DateCalendarColorEnumMap = {
  DateCalendarColor.blue: 'blue',
  DateCalendarColor.turquoise: 'turquoise',
  DateCalendarColor.green: 'green',
  DateCalendarColor.yellow: 'yellow',
  DateCalendarColor.brown: 'brown',
  DateCalendarColor.red: 'red',
  DateCalendarColor.pink: 'pink',
  DateCalendarColor.marine: 'marine',
  DateCalendarColor.purple: 'purple',
};
