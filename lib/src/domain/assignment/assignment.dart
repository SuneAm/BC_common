import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ordrestyring_common/ordrestyring_common.dart';
import 'package:ordrestyring_common/src/domain/date_calendar.dart';
import 'package:ordrestyring_common/src/utils/time_stamp_serializer.dart';
import 'package:timezone/timezone.dart' as tz;

part 'assignment.freezed.dart';
part 'assignment.g.dart';

enum AssignmentType { assignment, milestone }

@freezed
abstract class Assignment implements _$Assignment {
  const Assignment._();

  const factory Assignment({
    @Default('') String id,
    required String name,
    @TimestampSerializer() required tz.TZDateTime createdAt,
    required DateCalendar calendar,
    required AssignmentType type,
    // AssignmentCalendar? production,
    // AssignmentCalendar? montage,
    // CaseInfo? caseInfo,
  }) = _Assignment;

  factory Assignment.fromJson(Map<String, dynamic> json) =>
      _$AssignmentFromJson(json);

  factory Assignment.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();

    if (data == null) throw Exception('Assignment Is Empty');
    return Assignment.fromJson(data).copyWith(id: snapshot.id);
  }

  Map<String, dynamic> toFirestore() => toJson()..remove('id');
}
