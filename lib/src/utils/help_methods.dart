import 'package:ordrestyring_common/src/utils/date_time_extension.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class HelperMethod {
  /// Function to get the start date (Monday) of the current week
  static tz.TZDateTime getStartOfCurrentWeek() {
    tz.TZDateTime now = tz.TZDateTime.now(TimeZoneHelper.denmarkTimeZone);
    return now.subtract(Duration(days: now.weekday - 1));
  }

  /// Function to get the start date (Monday) of the current week
  static tz.TZDateTime getStartOfWeekByDate(tz.TZDateTime dateTime) {
    return dateTime.subtract(Duration(days: dateTime.weekday - 1));
  }

  // get all days of the week
  static List<tz.TZDateTime> getCurrentWeekDays() {
    final now = tz.TZDateTime.now(TimeZoneHelper.denmarkTimeZone);
    tz.TZDateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    return List.generate(7, (index) => startOfWeek.add(Duration(days: index)));
  }

  static List<tz.TZDateTime> getWeekdaysFromWeekNumber(
    int weekNumber,
    int year,
  ) {
    tz.TZDateTime firstDayOfYear = tz.TZDateTime(
      TimeZoneHelper.denmarkTimeZone,
      year,
      1,
      1,
    );
    int firstThursdayOffset = (4 - firstDayOfYear.weekday) % 7;
    tz.TZDateTime firstMondayOfFirstWeek =
        firstDayOfYear.add(Duration(days: firstThursdayOffset - 3));
    tz.TZDateTime startOfWeek =
        firstMondayOfFirstWeek.add(Duration(days: (weekNumber - 1) * 7));

    return List.generate(7, (i) => startOfWeek.add(Duration(days: i)));
  }

  // First get the ISO week-year for the start date of the week
  static tz.TZDateTime getFirstDayOfWeek(int week, int yr) {
    tz.TZDateTime firstThursday =
        tz.TZDateTime(TimeZoneHelper.denmarkTimeZone, yr, 1, 1);
    while (firstThursday.weekday != DateTime.thursday) {
      firstThursday = firstThursday.add(const Duration(days: 1));
    }

    final daysToAdd = (week - 1) * 7;
    final targetThursday = firstThursday.add(Duration(days: daysToAdd));
    return targetThursday
        .subtract(Duration(days: targetThursday.weekday - DateTime.monday));
  }

  /// Function to get the month of the week number
  static String getMonthFromWeekNumber(int weekNumber, int year) {
    final startOfWeek = _getDateFromWeekNumber(weekNumber, year);
    return '${startOfWeek.convertedToDanishMonthName} ${startOfWeek.year}';
  }

  // Function to get the start date of a week number
  static tz.TZDateTime _getDateFromWeekNumber(int weekNumber, int year) {
    tz.TZDateTime firstDayOfYear =
        tz.TZDateTime(TimeZoneHelper.denmarkTimeZone, year, 1, 1);
    int daysToAdd = (weekNumber - 1) * 7;
    tz.TZDateTime startOfWeek = firstDayOfYear.add(Duration(days: daysToAdd));
    return startOfWeek.subtract(Duration(days: startOfWeek.weekday - 1));
  }

  // Function to check if the week is the first week of the month
  static bool isFirstWeekOfMonth(int weekNumber, int year) {
    tz.TZDateTime startOfWeek = _getDateFromWeekNumber(weekNumber, year);
    tz.TZDateTime firstDayOfMonth = TimeZoneHelper.setDateTime(
      date: startOfWeek,
      day: 1,
    );
    return startOfWeek.isBefore(firstDayOfMonth.add(const Duration(days: 7))) &&
        startOfWeek.isAfter(firstDayOfMonth.subtract(const Duration(days: 1)));
  }

  // Helper function to check if dates are in same week
  static bool isInSameWeek(tz.TZDateTime date1, tz.TZDateTime date2) {
    final startOfWeek1 = date1.subtract(Duration(days: date1.weekday - 1));
    final startOfWeek2 = date2.subtract(Duration(days: date2.weekday - 1));
    return startOfWeek1.year == startOfWeek2.year &&
        startOfWeek1.month == startOfWeek2.month &&
        startOfWeek1.day == startOfWeek2.day;
  }

  static bool areDatesEqual(tz.TZDateTime date1, tz.TZDateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  // Check if the current day is on or between the start and end dates
  static bool isWithinRange(
    tz.TZDateTime date,
    tz.TZDateTime startDate,
    tz.TZDateTime endDate,
  ) =>
      (date.isAfter(startDate) || date.isAtSameMomentAs(startDate)) &&
      (date.isBefore(endDate) || date.isAtSameMomentAs(endDate));

  // Check if the current day is on or between the start and end dates
  static bool isAdjustedWithinRange(
    tz.TZDateTime date,
    tz.TZDateTime startDate,
    tz.TZDateTime endDate,
  ) {
    final adjustedDate = tz.TZDateTime(
        TimeZoneHelper.denmarkTimeZone, date.year, date.month, date.day);
    final adjustedStart = tz.TZDateTime(TimeZoneHelper.denmarkTimeZone,
        startDate.year, startDate.month, startDate.day);
    final adjustedEnd = tz.TZDateTime(TimeZoneHelper.denmarkTimeZone,
        endDate.year, endDate.month, endDate.day);
    return (adjustedDate.isAfter(adjustedStart) ||
            adjustedDate.isAtSameMomentAs(adjustedStart)) &&
        (adjustedDate.isBefore(adjustedEnd) ||
            adjustedDate.isAtSameMomentAs(adjustedEnd));
  }

  static int getISOWeekYear(tz.TZDateTime date) {
    final thursdayOfCurrentWeek =
        date.add(Duration(days: (4 - (date.weekday % 7))));

    return thursdayOfCurrentWeek.year;
  }

  static int getDayIndex({
    required tz.TZDateTime date,
    required tz.TZDateTime viewStartDate,
  }) {
    // Normalize both dates to midnight (00:00:00) in UTC
    tz.TZDateTime normalizedDate = tz.TZDateTime.utc(
      date.year,
      date.month,
      date.day,
    );
    tz.TZDateTime normalizedViewStartDate = tz.TZDateTime.utc(
      viewStartDate.year,
      viewStartDate.month,
      viewStartDate.day,
    );

    // Compute difference in days
    return normalizedDate.difference(normalizedViewStartDate).inDays;
  }
}

class TimeZoneHelper {
  // Define the time zone for Denmark
  static final denmarkTimeZone = tz.getLocation('Europe/Copenhagen');

  // Initialize time zone data
  static void initializeTimeZone() => tz.initializeTimeZones();

  static void setLocalLocation() => tz.setLocalLocation(
        denmarkTimeZone,
      );

  static tz.TZDateTime nowInCopenhagen() {
    return tz.TZDateTime.now(denmarkTimeZone);
  }

  static tz.TZDateTime setDateTime({
    required tz.TZDateTime date,
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
  }) {
    return tz.TZDateTime(
      TimeZoneHelper.denmarkTimeZone,
      year ?? date.year,
      month ?? date.month,
      day ?? date.day,
      hour ?? date.hour,
      minute ?? date.minute,
      0,
      0,
    );
  }
}

class TZDateTimeRange {
  TZDateTimeRange({required this.start, required this.end});

  final tz.TZDateTime start;
  final tz.TZDateTime end;

  bool contains(tz.TZDateTime date) {
    return date.isAfter(start) && date.isBefore(end);
  }

  Duration get duration => end.difference(start);
}
