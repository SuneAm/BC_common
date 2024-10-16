import 'package:intl/intl.dart';
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

  static DateTime getFirstDayOfWeek(int weekNumber, int year) {
    // Get the first day of the year
    DateTime firstDayOfYear = DateTime(year, 1, 1);

    // Get the number of weeks in the current year
    int totalWeeksInYear =
        ((DateTime(year + 1, 1, 1).difference(firstDayOfYear).inDays) / 7)
            .ceil();

    // Handle if the week number is greater than total weeks in the year
    if (weekNumber > totalWeeksInYear) {
      weekNumber -= totalWeeksInYear;
      year += 1; // Roll over to the next year
      firstDayOfYear = DateTime(year, 1, 1);
    }

    // Calculate the first day of the week
    DateTime firstDayOfWeek =
        firstDayOfYear.add(Duration(days: (weekNumber - 1) * 7));

    // Adjust to the start of the week (assuming Monday as the first day of the week)
    return firstDayOfWeek.subtract(Duration(days: firstDayOfWeek.weekday - 1));
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

  static int getWeeksInYear(int year) {
    // Get the first day of the next year
    DateTime firstDayOfNextYear = DateTime(year + 1, 1, 1);

    // Get the last day of the current year
    DateTime lastDayOfYear =
        firstDayOfNextYear.subtract(const Duration(days: 1));

    // Calculate the week number for the last day of the year
    int weekNumber = (lastDayOfYear.day / 7).ceil();

    return weekNumber;
  }

  static (int, int) getValidWeekNumber(int weekNumber, int year) {
    // Get the last day of the current year
    final lastDayOfYear = DateTime(year, 12, 31);

    // Determine if the year has 52 or 53 weeks
    final maxWeeks = (DateFormat('w').format(lastDayOfYear) == '53') ? 53 : 52;

    // Handle the case when the week number is greater than the max weeks (next year scenario)
    if (weekNumber > maxWeeks) {
      return (weekNumber - maxWeeks, year + 1);
    }

    // Handle the case when the week number is less than 1 (previous year scenario)
    if (weekNumber < 1) {
      // Get the last day of the previous year
      final lastDayOfPreviousYear = DateTime(year - 1, 12, 31);

      // Determine if the previous year had 52 or 53 weeks
      final maxWeeksPreviousYear =
          (DateFormat('w').format(lastDayOfPreviousYear) == '53') ? 53 : 52;

      // Return the week number from the previous year
      return (maxWeeksPreviousYear + weekNumber, year - 1);
    }

    // If the week number is valid, return it with the same year
    return (weekNumber, year);
  }

  /// Function to get the month of the week number
  static String getMonthFromWeekNumber(int weekNumber, int year) {
    DateTime startOfWeek = _getDateFromWeekNumber(weekNumber, year);
    // e.g., "January", "February"
    // return DateFormat('MMMM').format(startOfWeek);
    return startOfWeek.convertedToDanishMonthName;
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
}
