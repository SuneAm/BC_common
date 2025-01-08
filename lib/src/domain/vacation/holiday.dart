import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ordrestyring_common/src/utils/firestore_extentions.dart';
import 'package:ordrestyring_common/src/utils/time_stamp_serializer.dart';

part 'holiday.freezed.dart';

part 'holiday.g.dart';

@freezed
abstract class Holiday implements _$Holiday {
  const Holiday._();

  const factory Holiday({
    @Default('') String id,
    required String holidayName,
    @Default(true) bool isRecurring,
    @TimestampSerializer() required DateTime startDate,
    @TimestampSerializer() required DateTime endDate,
    @TimestampSerializer() required DateTime createdAt,
  }) = _Holiday;

  factory Holiday.fromJson(Map<String, dynamic> json) =>
      _$HolidayFromJson(json);

  factory Holiday.fromFirestore(DocSnap snapshot) {
    final data = snapshot.data();

    if (data == null) throw Exception('Holiday is empty');
    return Holiday.fromJson(data).copyWith(id: snapshot.id);
  }

  Map<String, dynamic> toFirestore() =>
      toJson()..remove('id'); // not allowing id to be in the document
}
