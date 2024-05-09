// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vacation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Vacation _$VacationFromJson(Map<String, dynamic> json) {
  return _Vacation.fromJson(json);
}

/// @nodoc
mixin _$Vacation {
  String get id => throw _privateConstructorUsedError;
  @TimestampSerializer()
  DateTime get startDate => throw _privateConstructorUsedError;
  @TimestampSerializer()
  DateTime get endDate => throw _privateConstructorUsedError;
  @TimestampSerializer()
  DateTime get createdAt => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  VacationStatus get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VacationCopyWith<Vacation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VacationCopyWith<$Res> {
  factory $VacationCopyWith(Vacation value, $Res Function(Vacation) then) =
      _$VacationCopyWithImpl<$Res, Vacation>;
  @useResult
  $Res call(
      {String id,
      @TimestampSerializer() DateTime startDate,
      @TimestampSerializer() DateTime endDate,
      @TimestampSerializer() DateTime createdAt,
      User user,
      VacationStatus status});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$VacationCopyWithImpl<$Res, $Val extends Vacation>
    implements $VacationCopyWith<$Res> {
  _$VacationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? createdAt = null,
    Object? user = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as VacationStatus,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VacationImplCopyWith<$Res>
    implements $VacationCopyWith<$Res> {
  factory _$$VacationImplCopyWith(
          _$VacationImpl value, $Res Function(_$VacationImpl) then) =
      __$$VacationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @TimestampSerializer() DateTime startDate,
      @TimestampSerializer() DateTime endDate,
      @TimestampSerializer() DateTime createdAt,
      User user,
      VacationStatus status});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$VacationImplCopyWithImpl<$Res>
    extends _$VacationCopyWithImpl<$Res, _$VacationImpl>
    implements _$$VacationImplCopyWith<$Res> {
  __$$VacationImplCopyWithImpl(
      _$VacationImpl _value, $Res Function(_$VacationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? createdAt = null,
    Object? user = null,
    Object? status = null,
  }) {
    return _then(_$VacationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as VacationStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VacationImpl extends _Vacation {
  const _$VacationImpl(
      {this.id = '',
      @TimestampSerializer() required this.startDate,
      @TimestampSerializer() required this.endDate,
      @TimestampSerializer() required this.createdAt,
      required this.user,
      this.status = VacationStatus.pending})
      : super._();

  factory _$VacationImpl.fromJson(Map<String, dynamic> json) =>
      _$$VacationImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @TimestampSerializer()
  final DateTime startDate;
  @override
  @TimestampSerializer()
  final DateTime endDate;
  @override
  @TimestampSerializer()
  final DateTime createdAt;
  @override
  final User user;
  @override
  @JsonKey()
  final VacationStatus status;

  @override
  String toString() {
    return 'Vacation(id: $id, startDate: $startDate, endDate: $endDate, createdAt: $createdAt, user: $user, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VacationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, startDate, endDate, createdAt, user, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VacationImplCopyWith<_$VacationImpl> get copyWith =>
      __$$VacationImplCopyWithImpl<_$VacationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VacationImplToJson(
      this,
    );
  }
}

abstract class _Vacation extends Vacation {
  const factory _Vacation(
      {final String id,
      @TimestampSerializer() required final DateTime startDate,
      @TimestampSerializer() required final DateTime endDate,
      @TimestampSerializer() required final DateTime createdAt,
      required final User user,
      final VacationStatus status}) = _$VacationImpl;
  const _Vacation._() : super._();

  factory _Vacation.fromJson(Map<String, dynamic> json) =
      _$VacationImpl.fromJson;

  @override
  String get id;
  @override
  @TimestampSerializer()
  DateTime get startDate;
  @override
  @TimestampSerializer()
  DateTime get endDate;
  @override
  @TimestampSerializer()
  DateTime get createdAt;
  @override
  User get user;
  @override
  VacationStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$VacationImplCopyWith<_$VacationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
