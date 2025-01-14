import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'case_estimated_hour.freezed.dart';

part 'case_estimated_hour.g.dart';

@freezed
class CaseEstimatedHour with _$CaseEstimatedHour {
  const factory CaseEstimatedHour({
    double? estimatedProjectHour,
    double? estimatedProductionHour,
    double? estimatedMontageHour,
    double? estimatedMaterialPrice,
    HourRate? projectRate,
    HourRate? produktionRate,
    HourRate? montageRate,
    HourRate? materialRate,
  }) = _CaseEstimatedHour;

  factory CaseEstimatedHour.fromJson(Map<String, dynamic> json) =>
      _$CaseEstimatedHourFromJson(json);
}

@freezed
class HourRate with _$HourRate {
  const factory HourRate({
    double? costPrice,
    double? salesPrice,
  }) = _EstimatedHourRate;

  factory HourRate.fromJson(Map<String, dynamic> json) =>
      _$HourRateFromJson(json);
}
