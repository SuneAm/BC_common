import 'package:json_annotation/json_annotation.dart';
import 'package:ordrestyring_common/ordrestyring_common.dart'
    show TimeZoneHelper;
import 'package:timezone/timezone.dart' as tz;

class IntToTimestampConverter implements JsonConverter<tz.TZDateTime, int> {
  const IntToTimestampConverter();

  @override
  tz.TZDateTime fromJson(int timestamp) {
    final utcDateTime =
        DateTime.fromMillisecondsSinceEpoch(timestamp * 1000, isUtc: true);
    return tz.TZDateTime.from(utcDateTime, TimeZoneHelper.denmarkTimeZone);
  }

  @override
  int toJson(tz.TZDateTime date) {
    return (date.millisecondsSinceEpoch / 1000).round();
  }
}
