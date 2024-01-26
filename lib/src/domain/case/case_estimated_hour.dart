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
  }) = _CaseEstimatedHour;

  factory CaseEstimatedHour.fromJson(Map<String, dynamic> json) =>
      _$CaseEstimatedHourFromJson(json);
}
