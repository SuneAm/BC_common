import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ordrestyring_common/ordrestyring_common.dart'
    show TimeZoneHelper;
import 'package:timezone/timezone.dart' as tz;

class TimestampSerializer implements JsonConverter<tz.TZDateTime, Timestamp> {
  const TimestampSerializer();

  @override
  tz.TZDateTime fromJson(Timestamp timestamp) {
    final utcDate = timestamp.toDate().toUtc();
    return tz.TZDateTime.from(utcDate, TimeZoneHelper.denmarkTimeZone);
  }

  tz.TZDateTime convertIntToTZDateTime(int timestamp) {
    final utcDateTime = DateTime.fromMillisecondsSinceEpoch(
      timestamp,
      isUtc: true,
    );
    return tz.TZDateTime.from(utcDateTime, TimeZoneHelper.denmarkTimeZone);
  }

  @override
  Timestamp toJson(tz.TZDateTime? date) {
    return Timestamp.fromDate(date?.toUtc() ?? DateTime.now().toUtc());
  }
}
