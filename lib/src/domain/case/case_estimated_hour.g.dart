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
    );

Map<String, dynamic> _$$CaseEstimatedHourImplToJson(
    _$CaseEstimatedHourImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('estimatedProjectHour', instance.estimatedProjectHour);
  writeNotNull('estimatedProductionHour', instance.estimatedProductionHour);
  writeNotNull('estimatedMontageHour', instance.estimatedMontageHour);
  writeNotNull('estimatedMaterialPrice', instance.estimatedMaterialPrice);
  return val;
}
