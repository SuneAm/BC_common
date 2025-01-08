import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ordrestyring_common/src/domain/assignment/assignment.dart';
import 'package:ordrestyring_common/src/domain/case/case.dart';

part 'calendar_wrapper.freezed.dart';

@freezed
abstract class CalendarWrapper with _$CalendarWrapper {
  const factory CalendarWrapper.job(Case c) = _JobCalendarWrapper;

  const factory CalendarWrapper.assignment(Assignment a) =
      _AssignmentCalendarWrapper;
}
