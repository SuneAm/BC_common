import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ordrestyring_common/src/utils/time_stamp_serializer.dart';

part 'assignment_calendar.freezed.dart';
part 'assignment_calendar.g.dart';

@freezed
class AssignmentCalendar with _$AssignmentCalendar {
  const factory AssignmentCalendar({
    @TimestampSerializer() required DateTime startDate,
    @TimestampSerializer() required DateTime endDate,
  }) = _AssignmentCalendar;

  factory AssignmentCalendar.fromJson(Map<String, dynamic> json) =>
      _$AssignmentCalendarFromJson(json);
}
