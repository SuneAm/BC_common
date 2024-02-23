// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_person.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContactPerson _$ContactPersonFromJson(Map<String, dynamic> json) {
  return _ContactPerson.fromJson(json);
}

/// @nodoc
mixin _$ContactPerson {
  String get name => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContactPersonCopyWith<ContactPerson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactPersonCopyWith<$Res> {
  factory $ContactPersonCopyWith(
          ContactPerson value, $Res Function(ContactPerson) then) =
      _$ContactPersonCopyWithImpl<$Res, ContactPerson>;
  @useResult
  $Res call({String name, String phoneNumber});
}

/// @nodoc
class _$ContactPersonCopyWithImpl<$Res, $Val extends ContactPerson>
    implements $ContactPersonCopyWith<$Res> {
  _$ContactPersonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phoneNumber = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContactPersonImplCopyWith<$Res>
    implements $ContactPersonCopyWith<$Res> {
  factory _$$ContactPersonImplCopyWith(
          _$ContactPersonImpl value, $Res Function(_$ContactPersonImpl) then) =
      __$$ContactPersonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String phoneNumber});
}

/// @nodoc
class __$$ContactPersonImplCopyWithImpl<$Res>
    extends _$ContactPersonCopyWithImpl<$Res, _$ContactPersonImpl>
    implements _$$ContactPersonImplCopyWith<$Res> {
  __$$ContactPersonImplCopyWithImpl(
      _$ContactPersonImpl _value, $Res Function(_$ContactPersonImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phoneNumber = null,
  }) {
    return _then(_$ContactPersonImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContactPersonImpl implements _ContactPerson {
  const _$ContactPersonImpl({required this.name, required this.phoneNumber});

  factory _$ContactPersonImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactPersonImplFromJson(json);

  @override
  final String name;
  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'ContactPerson(name: $name, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactPersonImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactPersonImplCopyWith<_$ContactPersonImpl> get copyWith =>
      __$$ContactPersonImplCopyWithImpl<_$ContactPersonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContactPersonImplToJson(
      this,
    );
  }
}

abstract class _ContactPerson implements ContactPerson {
  const factory _ContactPerson(
      {required final String name,
      required final String phoneNumber}) = _$ContactPersonImpl;

  factory _ContactPerson.fromJson(Map<String, dynamic> json) =
      _$ContactPersonImpl.fromJson;

  @override
  String get name;
  @override
  String get phoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$ContactPersonImplCopyWith<_$ContactPersonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
