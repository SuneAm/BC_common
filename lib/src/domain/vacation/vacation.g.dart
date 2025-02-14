// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vacation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VacationImpl _$$VacationImplFromJson(Map<String, dynamic> json) =>
    _$VacationImpl(
      id: json['id'] as String? ?? '',
      name: json['name'] as String?,
      createdAt:
          const TimestampSerializer().fromJson(json['createdAt'] as Timestamp),
      calendar: DateCalendar.fromJson(json['calendar'] as Map<String, dynamic>),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      status: $enumDecodeNullable(_$VacationStatusEnumMap, json['status']) ??
          VacationStatus.pending,
      type: $enumDecodeNullable(_$VacationTypeEnumMap, json['type']) ??
          VacationType.ferie,
    );

Map<String, dynamic> _$$VacationImplToJson(_$VacationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      if (instance.name case final value?) 'name': value,
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
      'calendar': instance.calendar.toJson(),
      'user': instance.user.toJson(),
      'status': _$VacationStatusEnumMap[instance.status]!,
      'type': _$VacationTypeEnumMap[instance.type]!,
    };

const _$VacationStatusEnumMap = {
  VacationStatus.pending: 'pending',
  VacationStatus.approved: 'approved',
  VacationStatus.rejected: 'rejected',
};

const _$VacationTypeEnumMap = {
  VacationType.ferie: 'ferie',
  VacationType.sygdom: 'sygdom',
  VacationType.costum: 'costum',
};
