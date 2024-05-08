// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num).toInt(),
      active: json['active'] as bool,
      fullName: json['fullName'] as String,
      initials: json['initials'] as String,
      role: json['role'] as String,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'active': instance.active,
      'fullName': instance.fullName,
      'initials': instance.initials,
      'role': instance.role,
    };
