// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'case_estimated_hour.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CaseEstimatedHour _$CaseEstimatedHourFromJson(Map<String, dynamic> json) {
  return _CaseEstimatedHour.fromJson(json);
}

/// @nodoc
mixin _$CaseEstimatedHour {
  double? get estimatedProjectHour => throw _privateConstructorUsedError;
  double? get estimatedProductionHour => throw _privateConstructorUsedError;
  double? get estimatedMontageHour => throw _privateConstructorUsedError;
  double? get estimatedMaterialPrice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CaseEstimatedHourCopyWith<CaseEstimatedHour> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CaseEstimatedHourCopyWith<$Res> {
  factory $CaseEstimatedHourCopyWith(
          CaseEstimatedHour value, $Res Function(CaseEstimatedHour) then) =
      _$CaseEstimatedHourCopyWithImpl<$Res, CaseEstimatedHour>;
  @useResult
  $Res call(
      {double? estimatedProjectHour,
      double? estimatedProductionHour,
      double? estimatedMontageHour,
      double? estimatedMaterialPrice});
}

/// @nodoc
class _$CaseEstimatedHourCopyWithImpl<$Res, $Val extends CaseEstimatedHour>
    implements $CaseEstimatedHourCopyWith<$Res> {
  _$CaseEstimatedHourCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? estimatedProjectHour = freezed,
    Object? estimatedProductionHour = freezed,
    Object? estimatedMontageHour = freezed,
    Object? estimatedMaterialPrice = freezed,
  }) {
    return _then(_value.copyWith(
      estimatedProjectHour: freezed == estimatedProjectHour
          ? _value.estimatedProjectHour
          : estimatedProjectHour // ignore: cast_nullable_to_non_nullable
              as double?,
      estimatedProductionHour: freezed == estimatedProductionHour
          ? _value.estimatedProductionHour
          : estimatedProductionHour // ignore: cast_nullable_to_non_nullable
              as double?,
      estimatedMontageHour: freezed == estimatedMontageHour
          ? _value.estimatedMontageHour
          : estimatedMontageHour // ignore: cast_nullable_to_non_nullable
              as double?,
      estimatedMaterialPrice: freezed == estimatedMaterialPrice
          ? _value.estimatedMaterialPrice
          : estimatedMaterialPrice // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CaseEstimatedHourImplCopyWith<$Res>
    implements $CaseEstimatedHourCopyWith<$Res> {
  factory _$$CaseEstimatedHourImplCopyWith(_$CaseEstimatedHourImpl value,
          $Res Function(_$CaseEstimatedHourImpl) then) =
      __$$CaseEstimatedHourImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? estimatedProjectHour,
      double? estimatedProductionHour,
      double? estimatedMontageHour,
      double? estimatedMaterialPrice});
}

/// @nodoc
class __$$CaseEstimatedHourImplCopyWithImpl<$Res>
    extends _$CaseEstimatedHourCopyWithImpl<$Res, _$CaseEstimatedHourImpl>
    implements _$$CaseEstimatedHourImplCopyWith<$Res> {
  __$$CaseEstimatedHourImplCopyWithImpl(_$CaseEstimatedHourImpl _value,
      $Res Function(_$CaseEstimatedHourImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? estimatedProjectHour = freezed,
    Object? estimatedProductionHour = freezed,
    Object? estimatedMontageHour = freezed,
    Object? estimatedMaterialPrice = freezed,
  }) {
    return _then(_$CaseEstimatedHourImpl(
      estimatedProjectHour: freezed == estimatedProjectHour
          ? _value.estimatedProjectHour
          : estimatedProjectHour // ignore: cast_nullable_to_non_nullable
              as double?,
      estimatedProductionHour: freezed == estimatedProductionHour
          ? _value.estimatedProductionHour
          : estimatedProductionHour // ignore: cast_nullable_to_non_nullable
              as double?,
      estimatedMontageHour: freezed == estimatedMontageHour
          ? _value.estimatedMontageHour
          : estimatedMontageHour // ignore: cast_nullable_to_non_nullable
              as double?,
      estimatedMaterialPrice: freezed == estimatedMaterialPrice
          ? _value.estimatedMaterialPrice
          : estimatedMaterialPrice // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CaseEstimatedHourImpl
    with DiagnosticableTreeMixin
    implements _CaseEstimatedHour {
  const _$CaseEstimatedHourImpl(
      {this.estimatedProjectHour,
      this.estimatedProductionHour,
      this.estimatedMontageHour,
      this.estimatedMaterialPrice});

  factory _$CaseEstimatedHourImpl.fromJson(Map<String, dynamic> json) =>
      _$$CaseEstimatedHourImplFromJson(json);

  @override
  final double? estimatedProjectHour;
  @override
  final double? estimatedProductionHour;
  @override
  final double? estimatedMontageHour;
  @override
  final double? estimatedMaterialPrice;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CaseEstimatedHour(estimatedProjectHour: $estimatedProjectHour, estimatedProductionHour: $estimatedProductionHour, estimatedMontageHour: $estimatedMontageHour, estimatedMaterialPrice: $estimatedMaterialPrice)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CaseEstimatedHour'))
      ..add(DiagnosticsProperty('estimatedProjectHour', estimatedProjectHour))
      ..add(DiagnosticsProperty(
          'estimatedProductionHour', estimatedProductionHour))
      ..add(DiagnosticsProperty('estimatedMontageHour', estimatedMontageHour))
      ..add(DiagnosticsProperty(
          'estimatedMaterialPrice', estimatedMaterialPrice));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CaseEstimatedHourImpl &&
            (identical(other.estimatedProjectHour, estimatedProjectHour) ||
                other.estimatedProjectHour == estimatedProjectHour) &&
            (identical(
                    other.estimatedProductionHour, estimatedProductionHour) ||
                other.estimatedProductionHour == estimatedProductionHour) &&
            (identical(other.estimatedMontageHour, estimatedMontageHour) ||
                other.estimatedMontageHour == estimatedMontageHour) &&
            (identical(other.estimatedMaterialPrice, estimatedMaterialPrice) ||
                other.estimatedMaterialPrice == estimatedMaterialPrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, estimatedProjectHour,
      estimatedProductionHour, estimatedMontageHour, estimatedMaterialPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CaseEstimatedHourImplCopyWith<_$CaseEstimatedHourImpl> get copyWith =>
      __$$CaseEstimatedHourImplCopyWithImpl<_$CaseEstimatedHourImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CaseEstimatedHourImplToJson(
      this,
    );
  }
}

abstract class _CaseEstimatedHour implements CaseEstimatedHour {
  const factory _CaseEstimatedHour(
      {final double? estimatedProjectHour,
      final double? estimatedProductionHour,
      final double? estimatedMontageHour,
      final double? estimatedMaterialPrice}) = _$CaseEstimatedHourImpl;

  factory _CaseEstimatedHour.fromJson(Map<String, dynamic> json) =
      _$CaseEstimatedHourImpl.fromJson;

  @override
  double? get estimatedProjectHour;
  @override
  double? get estimatedProductionHour;
  @override
  double? get estimatedMontageHour;
  @override
  double? get estimatedMaterialPrice;
  @override
  @JsonKey(ignore: true)
  _$$CaseEstimatedHourImplCopyWith<_$CaseEstimatedHourImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
