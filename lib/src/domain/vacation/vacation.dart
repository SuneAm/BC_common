import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ordrestyring_common/src/domain/date_calendar.dart';
import 'package:ordrestyring_common/src/domain/users/user_info.dart';
import 'package:ordrestyring_common/src/utils/firestore_extentions.dart';
import 'package:ordrestyring_common/src/utils/serializers/time_stamp_serializer.dart';
import 'package:timezone/timezone.dart' as tz;
part 'vacation.freezed.dart';

part 'vacation.g.dart';

enum VacationStatus { pending, approved, rejected }

enum VacationType {
  costum,
  sygdom,
  ferie,
  ;

  bool get isSygdom => this == VacationType.sygdom;

  String get name => switch (this) {
        VacationType.ferie => 'Ferie',
        VacationType.sygdom => 'Sygdom',
        VacationType.costum => 'Costum'
      };

  String get title => switch (this) {
        VacationType.costum => 'Event',
        _ => name,
      };

  String get dropdownTitle => switch (this) {
        VacationType.costum => 'Costum Event',
        _ => name,
      };
}

@freezed
abstract class Vacation implements _$Vacation {
  const Vacation._();

  const factory Vacation({
    @Default('') String id,
    String? name,
    @TimestampSerializer() required tz.TZDateTime createdAt,
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
