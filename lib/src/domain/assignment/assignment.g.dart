// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assignment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssignmentImpl _$$AssignmentImplFromJson(Map<String, dynamic> json) =>
    _$AssignmentImpl(
      id: json['id'] as String? ?? '',
      name: json['name'] as String,
      calendar:
          AssignmentCalendar.fromJson(json['calendar'] as Map<String, dynamic>),
      color: $enumDecodeNullable(_$AssignmentColorEnumMap, json['color']) ??
          AssignmentColor.blue,
    );

Map<String, dynamic> _$$AssignmentImplToJson(_$AssignmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'calendar': instance.calendar.toJson(),
      'color': _$AssignmentColorEnumMap[instance.color]!,
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
