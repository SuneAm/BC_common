import 'package:json_annotation/json_annotation.dart';
import 'package:ordrestyring_common/ordrestyring_common.dart'
    show DateCalendarColor;

class DateCalendarColorConverter
    implements JsonConverter<DateCalendarColor?, String?> {
  const DateCalendarColorConverter();

  @override
  DateCalendarColor? fromJson(String? json) {
    if (json == null) return null;
    return DateCalendarColor.values.firstWhere(
      (e) => e.toString().split('.').last == json,
      orElse: () => DateCalendarColor.blue, // Default value if not found
    );
  }

  @override
  String? toJson(DateCalendarColor? object) {
    return object?.toString().split('.').last;
  }
}
