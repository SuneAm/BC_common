import 'package:ordrestyring_common/src/utils/date_time_extension.dart';

class HelperMethod {
  /// Function to get the start date (Monday) of the current week
  static DateTime getStartOfCurrentWeek() {
    DateTime now = DateTime.now();
    // Find the Monday of the current week (assuming Monday is the start of the week)
    return now.subtract(Duration(days: now.weekday - 1));
  }

  /// Function to get the start date (Monday) of the current week
  static DateTime getStartOfWeekByDate(DateTime dateTime) {
    // Find the Monday of the current week (assuming Monday is the start of the week)
    return dateTime.subtract(Duration(days: dateTime.weekday - 1));
  }

  // get all days of the week
  static List<DateTime> getCurrentWeekDays() {
    final now = DateTime.now();
    // Find the first day of the week (Monday)
    DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    // Generate a list of all days in the current week
    return List.generate(7, (index) => startOfWeek.add(Duration(days: index)));
  }

  static List<DateTime> getWeekdaysFromWeekNumber(int weekNumber, int year) {
    // Find the first day of the year
    DateTime firstDayOfYear = DateTime(year, 1, 1);

    // ISO 8601 defines week 1 as the week containing the first Thursday
    int firstThursdayOffset = (4 - firstDayOfYear.weekday) % 7;

    // Calculate the first Monday of the first week
    DateTime firstMondayOfFirstWeek =
        firstDayOfYear.add(Duration(days: firstThursdayOffset - 3));

    // Calculate the start of the given week
    DateTime startOfWeek =
        firstMondayOfFirstWeek.add(Duration(days: (weekNumber - 1) * 7));

    // Generate the 7 days of the week starting from the calculated start date
    List<DateTime> weekDays = [];
    for (int i = 0; i < 7; i++) {
      weekDays.add(startOfWeek.add(Duration(days: i)));
    }

    return weekDays;
  }

  // First get the ISO week-year for the start date of the week
  static DateTime getFirstDayOfWeek(int week, int yr) {
    // Find first Thursday of the year
    DateTime firstThursday = DateTime(yr, 1, 1);
    while (firstThursday.weekday != DateTime.thursday) {
      firstThursday = firstThursday.add(const Duration(days: 1));
    }

    // Calculate the start of the requested week
    final daysToAdd = (week - 1) * 7;
    final targetThursday = firstThursday.add(Duration(days: daysToAdd));

    // Go back to Monday of that week
    return targetThursday
        .subtract(Duration(days: targetThursday.weekday - DateTime.monday));
  }

  /// Function to get the month of the week number
  static String getMonthFromWeekNumber(int weekNumber, int year) {
    final startOfWeek = _getDateFromWeekNumber(weekNumber, year);
    // e.g., "January", "February"
    // return DateFormat('MMMM').format(startOfWeek);
    return '${startOfWeek.convertedToDanishMonthName} ${startOfWeek.year}';
  }

  // Function to get the start date of a week number
  static DateTime _getDateFromWeekNumber(int weekNumber, int year) {
    DateTime firstDayOfYear = DateTime(year, 1, 1);
    int daysToAdd = (weekNumber - 1) * 7; // Weeks are 7 days long
    DateTime startOfWeek = firstDayOfYear.add(Duration(days: daysToAdd));

    // Adjust to the first day of the week (Monday) if necessary
    return startOfWeek.subtract(Duration(days: startOfWeek.weekday - 1));
  }

  // Function to check if the week is the first week of the month
  static bool isFirstWeekOfMonth(int weekNumber, int year) {
    DateTime startOfWeek = _getDateFromWeekNumber(weekNumber, year);

    // Get the first day of the month for the calculated week
    DateTime firstDayOfMonth = DateTime(startOfWeek.year, startOfWeek.month, 1);

    // Check if both dates are in the same week (Monday to Sunday)
    return startOfWeek.isBefore(firstDayOfMonth.add(const Duration(days: 7))) &&
        startOfWeek.isAfter(firstDayOfMonth.subtract(const Duration(days: 1)));
  }

  // Helper function to check if dates are in same week
  static bool isInSameWeek(DateTime date1, DateTime date2) {
    // Get the start of week for both dates
    // Assuming weeks start on Monday (can be adjusted if needed)
    final startOfWeek1 = date1.subtract(Duration(days: date1.weekday - 1));
    final startOfWeek2 = date2.subtract(Duration(days: date2.weekday - 1));

    return startOfWeek1.year == startOfWeek2.year &&
        startOfWeek1.month == startOfWeek2.month &&
        startOfWeek1.day == startOfWeek2.day;
  }

  static bool areDatesEqual(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  // Check if the current day is on or between the start and end dates
  static bool isWithinRange(
    DateTime date,
    DateTime startDate,
    DateTime endDate,
  ) =>
      (date.isAfter(startDate) || date.isAtSameMomentAs(startDate)) &&
      (date.isBefore(endDate) || date.isAtSameMomentAs(endDate));

  // Check if the current day is on or between the start and end dates
  static bool isAdjustedWithinRange(
    DateTime date,
    DateTime startDate,
    DateTime endDate,
  ) {
    final adjustedDate = DateTime(date.year, date.month, date.day);
    final adjustedStart =
        DateTime(startDate.year, startDate.month, startDate.day);
    final adjustedEnd = DateTime(endDate.year, endDate.month, endDate.day);
    return (adjustedDate.isAfter(adjustedStart) ||
            adjustedDate.isAtSameMomentAs(adjustedStart)) &&
        (adjustedDate.isBefore(adjustedEnd) ||
            adjustedDate.isAtSameMomentAs(adjustedEnd));
  }

  static int getISOWeekYear(DateTime date) {
    // Calculate the Thursday of the current week
    final thursdayOfCurrentWeek =
        date.add(Duration(days: (4 - (date.weekday % 7))));

    // The ISO year is the year of this Thursday
    return thursdayOfCurrentWeek.year;
  }
}
