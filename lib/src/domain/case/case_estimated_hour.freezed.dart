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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CaseEstimatedHour _$CaseEstimatedHourFromJson(Map<String, dynamic> json) {
  return _CaseEstimatedHour.fromJson(json);
}

/// @nodoc
mixin _$CaseEstimatedHour {
  double? get estimatedProjectHour => throw _privateConstructorUsedError;
  double? get estimatedProductionHour => throw _privateConstructorUsedError;
  double? get estimatedMontageHour => throw _privateConstructorUsedError;
  double? get estimatedMaterialPrice => throw _privateConstructorUsedError;
  HourRate? get projectRate => throw _privateConstructorUsedError;
  HourRate? get produktionRate => throw _privateConstructorUsedError;
  HourRate? get montageRate => throw _privateConstructorUsedError;
  HourRate? get materialRate => throw _privateConstructorUsedError;

  /// Serializes this CaseEstimatedHour to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CaseEstimatedHour
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      double? estimatedMaterialPrice,
      HourRate? projectRate,
      HourRate? produktionRate,
      HourRate? montageRate,
      HourRate? materialRate});

  $HourRateCopyWith<$Res>? get projectRate;
  $HourRateCopyWith<$Res>? get produktionRate;
  $HourRateCopyWith<$Res>? get montageRate;
  $HourRateCopyWith<$Res>? get materialRate;
}

/// @nodoc
class _$CaseEstimatedHourCopyWithImpl<$Res, $Val extends CaseEstimatedHour>
    implements $CaseEstimatedHourCopyWith<$Res> {
  _$CaseEstimatedHourCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CaseEstimatedHour
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? estimatedProjectHour = freezed,
    Object? estimatedProductionHour = freezed,
    Object? estimatedMontageHour = freezed,
    Object? estimatedMaterialPrice = freezed,
    Object? projectRate = freezed,
    Object? produktionRate = freezed,
    Object? montageRate = freezed,
    Object? materialRate = freezed,
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
      projectRate: freezed == projectRate
          ? _value.projectRate
          : projectRate // ignore: cast_nullable_to_non_nullable
              as HourRate?,
      produktionRate: freezed == produktionRate
          ? _value.produktionRate
          : produktionRate // ignore: cast_nullable_to_non_nullable
              as HourRate?,
      montageRate: freezed == montageRate
          ? _value.montageRate
          : montageRate // ignore: cast_nullable_to_non_nullable
              as HourRate?,
      materialRate: freezed == materialRate
          ? _value.materialRate
          : materialRate // ignore: cast_nullable_to_non_nullable
              as HourRate?,
    ) as $Val);
  }

  /// Create a copy of CaseEstimatedHour
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HourRateCopyWith<$Res>? get projectRate {
    if (_value.projectRate == null) {
      return null;
    }

    return $HourRateCopyWith<$Res>(_value.projectRate!, (value) {
      return _then(_value.copyWith(projectRate: value) as $Val);
    });
  }

  /// Create a copy of CaseEstimatedHour
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HourRateCopyWith<$Res>? get produktionRate {
    if (_value.produktionRate == null) {
      return null;
    }

    return $HourRateCopyWith<$Res>(_value.produktionRate!, (value) {
      return _then(_value.copyWith(produktionRate: value) as $Val);
    });
  }

  /// Create a copy of CaseEstimatedHour
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HourRateCopyWith<$Res>? get montageRate {
    if (_value.montageRate == null) {
      return null;
    }

    return $HourRateCopyWith<$Res>(_value.montageRate!, (value) {
      return _then(_value.copyWith(montageRate: value) as $Val);
    });
  }

  /// Create a copy of CaseEstimatedHour
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HourRateCopyWith<$Res>? get materialRate {
    if (_value.materialRate == null) {
      return null;
    }

    return $HourRateCopyWith<$Res>(_value.materialRate!, (value) {
      return _then(_value.copyWith(materialRate: value) as $Val);
    });
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
      double? estimatedMaterialPrice,
      HourRate? projectRate,
      HourRate? produktionRate,
      HourRate? montageRate,
      HourRate? materialRate});

  @override
  $HourRateCopyWith<$Res>? get projectRate;
  @override
  $HourRateCopyWith<$Res>? get produktionRate;
  @override
  $HourRateCopyWith<$Res>? get montageRate;
  @override
  $HourRateCopyWith<$Res>? get materialRate;
}

/// @nodoc
class __$$CaseEstimatedHourImplCopyWithImpl<$Res>
    extends _$CaseEstimatedHourCopyWithImpl<$Res, _$CaseEstimatedHourImpl>
    implements _$$CaseEstimatedHourImplCopyWith<$Res> {
  __$$CaseEstimatedHourImplCopyWithImpl(_$CaseEstimatedHourImpl _value,
      $Res Function(_$CaseEstimatedHourImpl) _then)
      : super(_value, _then);

  /// Create a copy of CaseEstimatedHour
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? estimatedProjectHour = freezed,
    Object? estimatedProductionHour = freezed,
    Object? estimatedMontageHour = freezed,
    Object? estimatedMaterialPrice = freezed,
    Object? projectRate = freezed,
    Object? produktionRate = freezed,
    Object? montageRate = freezed,
    Object? materialRate = freezed,
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
      projectRate: freezed == projectRate
          ? _value.projectRate
          : projectRate // ignore: cast_nullable_to_non_nullable
              as HourRate?,
      produktionRate: freezed == produktionRate
          ? _value.produktionRate
          : produktionRate // ignore: cast_nullable_to_non_nullable
              as HourRate?,
      montageRate: freezed == montageRate
          ? _value.montageRate
          : montageRate // ignore: cast_nullable_to_non_nullable
              as HourRate?,
      materialRate: freezed == materialRate
          ? _value.materialRate
          : materialRate // ignore: cast_nullable_to_non_nullable
              as HourRate?,
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
      this.estimatedMaterialPrice,
      this.projectRate,
      this.produktionRate,
      this.montageRate,
      this.materialRate});

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
  final HourRate? projectRate;
  @override
  final HourRate? produktionRate;
  @override
  final HourRate? montageRate;
  @override
  final HourRate? materialRate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CaseEstimatedHour(estimatedProjectHour: $estimatedProjectHour, estimatedProductionHour: $estimatedProductionHour, estimatedMontageHour: $estimatedMontageHour, estimatedMaterialPrice: $estimatedMaterialPrice, projectRate: $projectRate, produktionRate: $produktionRate, montageRate: $montageRate, materialRate: $materialRate)';
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
      ..add(
          DiagnosticsProperty('estimatedMaterialPrice', estimatedMaterialPrice))
      ..add(DiagnosticsProperty('projectRate', projectRate))
      ..add(DiagnosticsProperty('produktionRate', produktionRate))
      ..add(DiagnosticsProperty('montageRate', montageRate))
      ..add(DiagnosticsProperty('materialRate', materialRate));
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
                other.estimatedMaterialPrice == estimatedMaterialPrice) &&
            (identical(other.projectRate, projectRate) ||
                other.projectRate == projectRate) &&
            (identical(other.produktionRate, produktionRate) ||
                other.produktionRate == produktionRate) &&
            (identical(other.montageRate, montageRate) ||
                other.montageRate == montageRate) &&
            (identical(other.materialRate, materialRate) ||
                other.materialRate == materialRate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      estimatedProjectHour,
      estimatedProductionHour,
      estimatedMontageHour,
      estimatedMaterialPrice,
      projectRate,
      produktionRate,
      montageRate,
      materialRate);

  /// Create a copy of CaseEstimatedHour
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      final double? estimatedMaterialPrice,
      final HourRate? projectRate,
      final HourRate? produktionRate,
      final HourRate? montageRate,
      final HourRate? materialRate}) = _$CaseEstimatedHourImpl;

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
  HourRate? get projectRate;
  @override
  HourRate? get produktionRate;
  @override
  HourRate? get montageRate;
  @override
  HourRate? get materialRate;

  /// Create a copy of CaseEstimatedHour
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CaseEstimatedHourImplCopyWith<_$CaseEstimatedHourImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HourRate _$HourRateFromJson(Map<String, dynamic> json) {
  return _EstimatedHourRate.fromJson(json);
}

/// @nodoc
mixin _$HourRate {
  double? get costPrice => throw _privateConstructorUsedError;
  double? get salesPrice => throw _privateConstructorUsedError;

  /// Serializes this HourRate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HourRate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HourRateCopyWith<HourRate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HourRateCopyWith<$Res> {
  factory $HourRateCopyWith(HourRate value, $Res Function(HourRate) then) =
      _$HourRateCopyWithImpl<$Res, HourRate>;
  @useResult
  $Res call({double? costPrice, double? salesPrice});
}

/// @nodoc
class _$HourRateCopyWithImpl<$Res, $Val extends HourRate>
    implements $HourRateCopyWith<$Res> {
  _$HourRateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HourRate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? costPrice = freezed,
    Object? salesPrice = freezed,
  }) {
    return _then(_value.copyWith(
      costPrice: freezed == costPrice
          ? _value.costPrice
          : costPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      salesPrice: freezed == salesPrice
          ? _value.salesPrice
          : salesPrice // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EstimatedHourRateImplCopyWith<$Res>
    implements $HourRateCopyWith<$Res> {
  factory _$$EstimatedHourRateImplCopyWith(_$EstimatedHourRateImpl value,
          $Res Function(_$EstimatedHourRateImpl) then) =
      __$$EstimatedHourRateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? costPrice, double? salesPrice});
}

/// @nodoc
class __$$EstimatedHourRateImplCopyWithImpl<$Res>
    extends _$HourRateCopyWithImpl<$Res, _$EstimatedHourRateImpl>
    implements _$$EstimatedHourRateImplCopyWith<$Res> {
  __$$EstimatedHourRateImplCopyWithImpl(_$EstimatedHourRateImpl _value,
      $Res Function(_$EstimatedHourRateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HourRate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? costPrice = freezed,
    Object? salesPrice = freezed,
  }) {
    return _then(_$EstimatedHourRateImpl(
      costPrice: freezed == costPrice
          ? _value.costPrice
          : costPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      salesPrice: freezed == salesPrice
          ? _value.salesPrice
          : salesPrice // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EstimatedHourRateImpl
    with DiagnosticableTreeMixin
    implements _EstimatedHourRate {
  const _$EstimatedHourRateImpl({this.costPrice, this.salesPrice});

  factory _$EstimatedHourRateImpl.fromJson(Map<String, dynamic> json) =>
      _$$EstimatedHourRateImplFromJson(json);

  @override
  final double? costPrice;
  @override
  final double? salesPrice;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HourRate(costPrice: $costPrice, salesPrice: $salesPrice)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HourRate'))
      ..add(DiagnosticsProperty('costPrice', costPrice))
      ..add(DiagnosticsProperty('salesPrice', salesPrice));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EstimatedHourRateImpl &&
            (identical(other.costPrice, costPrice) ||
                other.costPrice == costPrice) &&
            (identical(other.salesPrice, salesPrice) ||
                other.salesPrice == salesPrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, costPrice, salesPrice);

  /// Create a copy of HourRate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EstimatedHourRateImplCopyWith<_$EstimatedHourRateImpl> get copyWith =>
      __$$EstimatedHourRateImplCopyWithImpl<_$EstimatedHourRateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EstimatedHourRateImplToJson(
      this,
    );
  }
}

abstract class _EstimatedHourRate implements HourRate {
  const factory _EstimatedHourRate(
      {final double? costPrice,
      final double? salesPrice}) = _$EstimatedHourRateImpl;

  factory _EstimatedHourRate.fromJson(Map<String, dynamic> json) =
      _$EstimatedHourRateImpl.fromJson;

  @override
  double? get costPrice;
  @override
  double? get salesPrice;

  /// Create a copy of HourRate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EstimatedHourRateImplCopyWith<_$EstimatedHourRateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
