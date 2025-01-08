import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ordrestyring_common/src/domain/users/user.dart';
import 'package:ordrestyring_common/src/utils/firestore_extentions.dart';
import 'package:ordrestyring_common/src/utils/time_stamp_serializer.dart';

part 'vacation.freezed.dart';

part 'vacation.g.dart';

enum VacationStatus { pending, approved, rejected }

@freezed
abstract class Vacation implements _$Vacation {
  const Vacation._();

  const factory Vacation({
    @Default('') String id,
    @TimestampSerializer() required DateTime startDate,
    @TimestampSerializer() required DateTime endDate,
    @TimestampSerializer() required DateTime createdAt,
    required User user,
    @Default(VacationStatus.pending) VacationStatus status,
  }) = _Vacation;

  factory Vacation.fromJson(Map<String, dynamic> json) =>
      _$VacationFromJson(json);

  factory Vacation.fromFirestore(DocSnap snapshot) {
    final data = snapshot.data();

    if (data == null) throw Exception('Vacation is empty');
    return Vacation.fromJson(data).copyWith(id: snapshot.id);
  }

  Map<String, dynamic> toFirestore() =>
      toJson()..remove('id'); // not allowing id to be in the document
}
