// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'case_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CaseInfo _$CaseInfoFromJson(Map<String, dynamic> json) {
  return _CaseInfo.fromJson(json);
}

/// @nodoc
mixin _$CaseInfo {
  String get id => throw _privateConstructorUsedError;
  String get caseNumber => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this CaseInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CaseInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CaseInfoCopyWith<CaseInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CaseInfoCopyWith<$Res> {
  factory $CaseInfoCopyWith(CaseInfo value, $Res Function(CaseInfo) then) =
      _$CaseInfoCopyWithImpl<$Res, CaseInfo>;
  @useResult
  $Res call({String id, String caseNumber, String name});
}

/// @nodoc
class _$CaseInfoCopyWithImpl<$Res, $Val extends CaseInfo>
    implements $CaseInfoCopyWith<$Res> {
  _$CaseInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CaseInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? caseNumber = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      caseNumber: null == caseNumber
          ? _value.caseNumber
          : caseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CaseInfoImplCopyWith<$Res>
    implements $CaseInfoCopyWith<$Res> {
  factory _$$CaseInfoImplCopyWith(
          _$CaseInfoImpl value, $Res Function(_$CaseInfoImpl) then) =
      __$$CaseInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String caseNumber, String name});
}

/// @nodoc
class __$$CaseInfoImplCopyWithImpl<$Res>
    extends _$CaseInfoCopyWithImpl<$Res, _$CaseInfoImpl>
    implements _$$CaseInfoImplCopyWith<$Res> {
  __$$CaseInfoImplCopyWithImpl(
      _$CaseInfoImpl _value, $Res Function(_$CaseInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CaseInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? caseNumber = null,
    Object? name = null,
  }) {
    return _then(_$CaseInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      caseNumber: null == caseNumber
          ? _value.caseNumber
          : caseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CaseInfoImpl with DiagnosticableTreeMixin implements _CaseInfo {
  const _$CaseInfoImpl(
      {required this.id, required this.caseNumber, required this.name});

  factory _$CaseInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CaseInfoImplFromJson(json);

  @override
  final String id;
  @override
  final String caseNumber;
  @override
  final String name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CaseInfo(id: $id, caseNumber: $caseNumber, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CaseInfo'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('caseNumber', caseNumber))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CaseInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.caseNumber, caseNumber) ||
                other.caseNumber == caseNumber) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, caseNumber, name);

  /// Create a copy of CaseInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CaseInfoImplCopyWith<_$CaseInfoImpl> get copyWith =>
      __$$CaseInfoImplCopyWithImpl<_$CaseInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CaseInfoImplToJson(
      this,
    );
  }
}

abstract class _CaseInfo implements CaseInfo {
  const factory _CaseInfo(
      {required final String id,
      required final String caseNumber,
      required final String name}) = _$CaseInfoImpl;

  factory _CaseInfo.fromJson(Map<String, dynamic> json) =
      _$CaseInfoImpl.fromJson;

  @override
  String get id;
  @override
  String get caseNumber;
  @override
  String get name;

  /// Create a copy of CaseInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CaseInfoImplCopyWith<_$CaseInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
