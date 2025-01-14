// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeliveryAddressImpl _$$DeliveryAddressImplFromJson(
        Map<String, dynamic> json) =>
    _$DeliveryAddressImpl(
      address: json['address'] as String?,
      postalCode: json['postalCode'] as String?,
      city: json['city'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$DeliveryAddressImplToJson(
        _$DeliveryAddressImpl instance) =>
    <String, dynamic>{
      if (instance.address case final value?) 'address': value,
      if (instance.postalCode case final value?) 'postalCode': value,
      if (instance.city case final value?) 'city': value,
      if (instance.name case final value?) 'name': value,
    };
