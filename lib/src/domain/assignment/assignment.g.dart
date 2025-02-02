// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assignment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssignmentImpl _$$AssignmentImplFromJson(Map<String, dynamic> json) =>
    _$AssignmentImpl(
      id: json['id'] as String? ?? '',
      name: json['name'] as String,
      createdAt:
          const TimestampSerializer().fromJson(json['createdAt'] as Timestamp),
      color: $enumDecodeNullable(_$AssignmentColorEnumMap, json['color']) ??
          AssignmentColor.blue,
      calendar:
          AssignmentCalendar.fromJson(json['calendar'] as Map<String, dynamic>),
      type: $enumDecode(_$AssignmentTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$AssignmentImplToJson(_$AssignmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
      'color': _$AssignmentColorEnumMap[instance.color]!,
      'calendar': instance.calendar.toJson(),
      'type': _$AssignmentTypeEnumMap[instance.type]!,
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

const _$AssignmentTypeEnumMap = {
  AssignmentType.assignment: 'assignment',
  AssignmentType.milestone: 'milestone',
};
