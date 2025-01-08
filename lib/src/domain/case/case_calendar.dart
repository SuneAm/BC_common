import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ordrestyring_common/src/styles/ordrer_colors.dart';
import 'package:ordrestyring_common/src/utils/time_stamp_serializer.dart';

part 'case_calendar.freezed.dart';

part 'case_calendar.g.dart';

@freezed
class CaseCalendar with _$CaseCalendar {
  const factory CaseCalendar({
    @TimestampSerializer() required DateTime startDate,
    @TimestampSerializer() required DateTime endDate,
    AssignmentColor? peopleColor,
  }) = _CaseCalendar;

  factory CaseCalendar.fromJson(Map<String, dynamic> json) =>
      _$CaseCalendarFromJson(json);
}
