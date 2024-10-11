import 'package:intl/intl.dart';

class HelperMethod {
  // get a week number of the year
  static int getCurrentWeekNumber() {
    final now = DateTime.now();
    final dayOfYear = int.parse(DateFormat("D").format(now)); // Day of the year

    final weekNumber = ((dayOfYear - now.weekday + 10) / 7).floor();
    if (weekNumber > 53) {
      return weekNumber - 53;
    }
    return weekNumber;
  }

  // get all days of the week
  static List<DateTime> getCurrentWeekDays() {
    final now = DateTime.now();
    // Find the first day of the week (Monday)
    DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    // Generate a list of all days in the current week
    return List.generate(7, (index) => startOfWeek.add(Duration(days: index)));
  }

  /// Function to get the weekdays for a given week number
  static List<DateTime> getWeekdaysFromWeekNumber(int weekNumber) {
    DateTime now = DateTime.now();
    // Find the first day of the year
    DateTime firstDayOfYear = DateTime(now.year, 1, 1);

    // Calculate the number of days to add to get the start of the given week
    int daysToAdd = (weekNumber - 1) * 7;
    // Calculate the start of the week (considering Monday as the first day of the week)
    DateTime startOfWeek = firstDayOfYear.add(Duration(days: daysToAdd));

    // If the first day of the year is not a Monday, adjust to the previous Monday
    if (startOfWeek.weekday != DateTime.monday) {
      startOfWeek = startOfWeek.subtract(
        Duration(days: startOfWeek.weekday - DateTime.monday),
      );
    }

    // Generate the 7 days of the week
    List<DateTime> weekDays = [];
    for (int i = 0; i < 7; i++) {
      weekDays.add(startOfWeek.add(Duration(days: i)));
    }

    return weekDays;
  }

  /// Function to get the start date (Monday) of the current week
  static DateTime getStartOfCurrentWeek() {
    DateTime now = DateTime.now();
    // Find the Monday of the current week (assuming Monday is the start of the week)
    return now.subtract(Duration(days: now.weekday - 1));
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

  // Function to get the max number of weeks in a given year
  // static int getMaxWeeksInYear(int year) {
  //   // Get the last day of the year (December 31)
  //   DateTime lastDayOfYear = DateTime(year, 12, 31);
  //
  //   // Get the weekday of the last day (1 = Monday, 7 = Sunday)
  //   int weekdayOfLastDay = lastDayOfYear.weekday;
  //
  //   // If the last day of the year is a Thursday or it's a leap year, there will be 53 weeks
  //   if (weekdayOfLastDay == DateTime.thursday ||
  //       (weekdayOfLastDay == DateTime.wednesday && DateTime(year).le)) {
  //     return 53;
  //   }
  //
  //   // Otherwise, there are 52 weeks in the year
  //   return 52;
  // }

  // static int getValidWeekNumber(int weekNumber) {
  //   final currentYear = DateTime.now().year;
  //   int totalWeeksInCurrentYear = getWeeksInYear(currentYear);
  //
  //   if (weekNumber > totalWeeksInCurrentYear) {
  //     // Move to the next year's week
  //     return weekNumber - totalWeeksInCurrentYear;
  //   } else {
  //     return weekNumber;
  //   }
  // }

  static int getValidWeekNumber(int weekNumber) {
    final currentYear = DateTime.now().year; // Check if the year has 53 weeks

    final lastDayOfYear = DateTime(currentYear, 12, 31);
    final maxWeeks = (DateFormat('w').format(lastDayOfYear) == '53') ? 53 : 52;

    // Validate the week number
    return (weekNumber > maxWeeks) ? (weekNumber - maxWeeks) : weekNumber;
  }

  /// Function to get the month of the week number
  static String getMonthFromWeekNumber(int weekNumber) {
    final currentYear = DateTime.now().year;
    DateTime startOfWeek = _getDateFromWeekNumber(currentYear, weekNumber);
    // e.g., "January", "February"
    return DateFormat('MMMM').format(startOfWeek);
  }

  // Function to get the start date of a week number
  static DateTime _getDateFromWeekNumber(int year, int weekNumber) {
    DateTime firstDayOfYear = DateTime(year, 1, 1);
    int daysToAdd = (weekNumber - 1) * 7; // Weeks are 7 days long
    DateTime startOfWeek = firstDayOfYear.add(Duration(days: daysToAdd));

    // Adjust to the first day of the week (Monday) if necessary
    return startOfWeek.subtract(Duration(days: startOfWeek.weekday - 1));
  }

  // Function to check if the week is the first week of the month
  static bool isFirstWeekOfMonth(int weekNumber) {
    final currentYear = DateTime.now().year;
    DateTime startOfWeek = _getDateFromWeekNumber(currentYear, weekNumber);

    // Get the first day of the month for the calculated week
    DateTime firstDayOfMonth = DateTime(startOfWeek.year, startOfWeek.month, 1);

    // Check if both dates are in the same week (Monday to Sunday)
    return startOfWeek.isBefore(firstDayOfMonth.add(const Duration(days: 7))) &&
        startOfWeek.isAfter(firstDayOfMonth.subtract(const Duration(days: 1)));
  }
}
