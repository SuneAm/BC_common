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
          $enumDecodeNullable(_$PeopleColorEnumMap, json['peopleColor']),
    );

Map<String, dynamic> _$$CaseCalendarImplToJson(_$CaseCalendarImpl instance) {
  final val = <String, dynamic>{
    'startDate': const TimestampSerializer().toJson(instance.startDate),
    'endDate': const TimestampSerializer().toJson(instance.endDate),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('peopleColor', _$PeopleColorEnumMap[instance.peopleColor]);
  return val;
}

const _$PeopleColorEnumMap = {
  PeopleColor.blue: 'blue',
  PeopleColor.turquoise: 'turquoise',
  PeopleColor.green: 'green',
  PeopleColor.yellow: 'yellow',
  PeopleColor.brown: 'brown',
  PeopleColor.red: 'red',
  PeopleColor.pink: 'pink',
  PeopleColor.marine: 'marine',
  PeopleColor.purple: 'purple',
};
