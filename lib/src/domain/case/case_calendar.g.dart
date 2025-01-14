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
      peopleColor:
          $enumDecodeNullable(_$AssignmentColorEnumMap, json['peopleColor']),
    );

Map<String, dynamic> _$$CaseCalendarImplToJson(_$CaseCalendarImpl instance) =>
    <String, dynamic>{
      'startDate': const TimestampSerializer().toJson(instance.startDate),
      'endDate': const TimestampSerializer().toJson(instance.endDate),
      if (_$AssignmentColorEnumMap[instance.peopleColor] case final value?)
        'peopleColor': value,
    };

const _$AssignmentColorEnumMap = {
  AssignmentColor.blue: 'blue',
  AssignmentColor.turquoise: 'turquoise',
  AssignmentColor.green: 'green',
  AssignmentColor.yellow: 'yellow',
  AssignmentColor.brown: 'brown',
  AssignmentColor.red: 'red',
  AssignmentColor.pink: 'pink',
  AssignmentColor.marine: 'marine',
  AssignmentColor.purple: 'purple',
};
