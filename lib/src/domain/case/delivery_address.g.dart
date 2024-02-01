// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeliveryAddressImpl _$$DeliveryAddressImplFromJson(
        Map<String, dynamic> json) =>
    _$DeliveryAddressImpl(
      address: json['address'] as String?,
      att: json['att'] as String?,
      postalCode: json['postalCode'] as String?,
      city: json['city'] as String?,
      mobilePhoneNumber: json['mobilePhoneNumber'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$DeliveryAddressImplToJson(
    _$DeliveryAddressImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('address', instance.address);
  writeNotNull('att', instance.att);
  writeNotNull('postalCode', instance.postalCode);
  writeNotNull('city', instance.city);
  writeNotNull('mobilePhoneNumber', instance.mobilePhoneNumber);
  writeNotNull('name', instance.name);
  return val;
}
