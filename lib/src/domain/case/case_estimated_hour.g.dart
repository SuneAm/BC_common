// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'case_estimated_hour.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CaseEstimatedHourImpl _$$CaseEstimatedHourImplFromJson(
        Map<String, dynamic> json) =>
    _$CaseEstimatedHourImpl(
      estimatedProjectHour: (json['estimatedProjectHour'] as num?)?.toDouble(),
      estimatedProductionHour:
          (json['estimatedProductionHour'] as num?)?.toDouble(),
      estimatedMontageHour: (json['estimatedMontageHour'] as num?)?.toDouble(),
      estimatedMaterialPrice:
          (json['estimatedMaterialPrice'] as num?)?.toDouble(),
      projectRate: json['projectRate'] == null
          ? null
          : HourRate.fromJson(json['projectRate'] as Map<String, dynamic>),
      produktionRate: json['produktionRate'] == null
          ? null
          : HourRate.fromJson(json['produktionRate'] as Map<String, dynamic>),
      montageRate: json['montageRate'] == null
          ? null
          : HourRate.fromJson(json['montageRate'] as Map<String, dynamic>),
      materialRate: json['materialRate'] == null
          ? null
          : HourRate.fromJson(json['materialRate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CaseEstimatedHourImplToJson(
        _$CaseEstimatedHourImpl instance) =>
    <String, dynamic>{
      if (instance.estimatedProjectHour case final value?)
        'estimatedProjectHour': value,
      if (instance.estimatedProductionHour case final value?)
        'estimatedProductionHour': value,
      if (instance.estimatedMontageHour case final value?)
        'estimatedMontageHour': value,
      if (instance.estimatedMaterialPrice case final value?)
        'estimatedMaterialPrice': value,
      if (instance.projectRate?.toJson() case final value?)
        'projectRate': value,
      if (instance.produktionRate?.toJson() case final value?)
        'produktionRate': value,
      if (instance.montageRate?.toJson() case final value?)
        'montageRate': value,
      if (instance.materialRate?.toJson() case final value?)
        'materialRate': value,
    };

_$EstimatedHourRateImpl _$$EstimatedHourRateImplFromJson(
        Map<String, dynamic> json) =>
    _$EstimatedHourRateImpl(
      costPrice: (json['costPrice'] as num?)?.toDouble(),
      salesPrice: (json['salesPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$EstimatedHourRateImplToJson(
        _$EstimatedHourRateImpl instance) =>
    <String, dynamic>{
      if (instance.costPrice case final value?) 'costPrice': value,
      if (instance.salesPrice case final value?) 'salesPrice': value,
    };
