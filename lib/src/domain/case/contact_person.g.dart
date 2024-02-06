// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContactPersonImpl _$$ContactPersonImplFromJson(Map<String, dynamic> json) =>
    _$ContactPersonImpl(
      name: json['name'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$$ContactPersonImplToJson(_$ContactPersonImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('phoneNumber', instance.phoneNumber);
  return val;
}
