// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assignment_calendar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssignmentCalendarImpl _$$AssignmentCalendarImplFromJson(
        Map<String, dynamic> json) =>
    _$AssignmentCalendarImpl(
      startDate:
          const TimestampSerializer().fromJson(json['startDate'] as Timestamp),
      endDate:
          const TimestampSerializer().fromJson(json['endDate'] as Timestamp),
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => UserInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AssignmentCalendarImplToJson(
        _$AssignmentCalendarImpl instance) =>
    <String, dynamic>{
      'startDate': const TimestampSerializer().toJson(instance.startDate),
      'endDate': const TimestampSerializer().toJson(instance.endDate),
      if (instance.users?.map((e) => e.toJson()).toList() case final value?)
        'users': value,
    };
