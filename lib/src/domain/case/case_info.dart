import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'case_info.freezed.dart';
part 'case_info.g.dart';

@freezed
class CaseInfo with _$CaseInfo {
  const factory CaseInfo({
    required String id,
    required String caseNumber,
    required String name,
  }) = _CaseInfo;

  factory CaseInfo.fromJson(Map<String, dynamic> json) =>
      _$CaseInfoFromJson(json);
}
