// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vacation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VacationImpl _$$VacationImplFromJson(Map<String, dynamic> json) =>
    _$VacationImpl(
      id: json['id'] as String? ?? '',
      startDate:
          const TimestampSerializer().fromJson(json['startDate'] as Timestamp),
      endDate:
          const TimestampSerializer().fromJson(json['endDate'] as Timestamp),
      createdAt:
          const TimestampSerializer().fromJson(json['createdAt'] as Timestamp),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      status: $enumDecodeNullable(_$VacationStatusEnumMap, json['status']) ??
          VacationStatus.pending,
    );

Map<String, dynamic> _$$VacationImplToJson(_$VacationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startDate': const TimestampSerializer().toJson(instance.startDate),
      'endDate': const TimestampSerializer().toJson(instance.endDate),
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
      'user': instance.user.toJson(),
      'status': _$VacationStatusEnumMap[instance.status]!,
    };

const _$VacationStatusEnumMap = {
  VacationStatus.pending: 'pending',
  VacationStatus.approved: 'approved',
  VacationStatus.rejected: 'rejected',
};
