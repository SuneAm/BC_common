import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ordrestyring_common/src/domain/date_calendar.dart';
import 'package:ordrestyring_common/src/domain/users/user_info.dart';
import 'package:ordrestyring_common/src/utils/firestore_extentions.dart';
import 'package:ordrestyring_common/src/utils/time_stamp_serializer.dart';

part 'vacation.freezed.dart';

part 'vacation.g.dart';

enum VacationStatus { pending, approved, rejected }

enum VacationType {
  costum,
  sygdom,
  ferie,
  ;

  String get name => switch (this) {
        VacationType.ferie => 'Ferie',
        VacationType.sygdom => 'Sygdom',
        VacationType.costum => 'Costum'
      };

  bool get isSygdom => this == VacationType.sygdom;
}

@freezed
abstract class Vacation implements _$Vacation {
  const Vacation._();

  const factory Vacation({
    @Default('') String id,
    String? name,
    @TimestampSerializer() required DateTime createdAt,
    required DateCalendar calendar,
    required UserInfo user,
    @Default(VacationStatus.pending) VacationStatus status,
    @Default(VacationType.ferie) VacationType type,
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
