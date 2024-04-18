// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeliveryAddress _$DeliveryAddressFromJson(Map<String, dynamic> json) {
  return _DeliveryAddress.fromJson(json);
}

/// @nodoc
mixin _$DeliveryAddress {
  String? get address => throw _privateConstructorUsedError;
  String? get postalCode => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeliveryAddressCopyWith<DeliveryAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryAddressCopyWith<$Res> {
  factory $DeliveryAddressCopyWith(
          DeliveryAddress value, $Res Function(DeliveryAddress) then) =
      _$DeliveryAddressCopyWithImpl<$Res, DeliveryAddress>;
  @useResult
  $Res call({String? address, String? postalCode, String? city, String? name});
}

/// @nodoc
class _$DeliveryAddressCopyWithImpl<$Res, $Val extends DeliveryAddress>
    implements $DeliveryAddressCopyWith<$Res> {
  _$DeliveryAddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = freezed,
    Object? postalCode = freezed,
    Object? city = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeliveryAddressImplCopyWith<$Res>
    implements $DeliveryAddressCopyWith<$Res> {
  factory _$$DeliveryAddressImplCopyWith(_$DeliveryAddressImpl value,
          $Res Function(_$DeliveryAddressImpl) then) =
      __$$DeliveryAddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? address, String? postalCode, String? city, String? name});
}

/// @nodoc
class __$$DeliveryAddressImplCopyWithImpl<$Res>
    extends _$DeliveryAddressCopyWithImpl<$Res, _$DeliveryAddressImpl>
    implements _$$DeliveryAddressImplCopyWith<$Res> {
  __$$DeliveryAddressImplCopyWithImpl(
      _$DeliveryAddressImpl _value, $Res Function(_$DeliveryAddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = freezed,
    Object? postalCode = freezed,
    Object? city = freezed,
    Object? name = freezed,
  }) {
    return _then(_$DeliveryAddressImpl(
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeliveryAddressImpl implements _DeliveryAddress {
  const _$DeliveryAddressImpl(
      {this.address, this.postalCode, this.city, this.name});

  factory _$DeliveryAddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliveryAddressImplFromJson(json);

  @override
  final String? address;
  @override
  final String? postalCode;
  @override
  final String? city;
  @override
  final String? name;

  @override
  String toString() {
    return 'DeliveryAddress(address: $address, postalCode: $postalCode, city: $city, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryAddressImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, address, postalCode, city, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryAddressImplCopyWith<_$DeliveryAddressImpl> get copyWith =>
      __$$DeliveryAddressImplCopyWithImpl<_$DeliveryAddressImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliveryAddressImplToJson(
      this,
    );
  }
}

abstract class _DeliveryAddress implements DeliveryAddress {
  const factory _DeliveryAddress(
      {final String? address,
      final String? postalCode,
      final String? city,
      final String? name}) = _$DeliveryAddressImpl;

  factory _DeliveryAddress.fromJson(Map<String, dynamic> json) =
      _$DeliveryAddressImpl.fromJson;

  @override
  String? get address;
  @override
  String? get postalCode;
  @override
  String? get city;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$DeliveryAddressImplCopyWith<_$DeliveryAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
