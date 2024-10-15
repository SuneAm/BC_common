import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:week_of_year/week_of_year.dart';

extension DateTimeExtension on DateTime {
  String _twoDigits(int i) => i <= 9 ? '0$i' : i.toString();

  String get formatTime => DateFormat('h:mm a').format(this); // 3:31pm

  String get showDate => DateFormat('d').format(this); // 3:31pm

  String get formatDateSimple =>
      '$year-${_twoDigits(month)}-${_twoDigits(day)}'; // 2021-01-01

  String get formatDateNumber {
    // 21/01/20 3:31pm
    // final dateFormat = DateFormat.yMd().add_jm();
    final dateFormat = DateFormat('MM/dd/yyyy');
    return dateFormat.format(this);
  }

  String get formatDate {
    final dateFormat = DateFormat('MMMM d, yyyy'); // March 12, 2020
    return dateFormat.format(this);
  }

  // String get formatEventDateShort {
  //   final dateFormat = DateFormat('MMMM d'); // Nov 30
  //   return dateFormat.format(this);
  // }

  String get formatDateSameWeek {
    DateFormat dateFormat;
    if (day == DateTime.now().day) {
      dateFormat = DateFormat('h:mm a'); // 3:31pm
    } else {
      dateFormat = DateFormat('EEEE, hh:mm a'); // Wednesday, 3:31pm
    }
    return dateFormat.format(this);
  }

  String get formatDateWithTime {
    final dateFormat =
        DateFormat('hh:mm a | d MMM yyyy'); // 12 May, 2020 | 3:31pm
    return dateFormat.format(this);
  }

  bool get isSameWeek => DateTime.now().difference(this).inDays < 7;

  DateTime combineDateTime(TimeOfDay time) =>
      DateTime(year, month, day, time.hour, time.minute);

  String customFormat(String format) => DateFormat(format).format(this);

  bool get isToday {
    DateTime today = DateTime.now();
    return year == today.year && month == today.month && day == today.day;
  }

  // Check if the day is a weekend (Saturday or Sunday)
  bool get isWeekend =>
      weekday == DateTime.saturday || weekday == DateTime.sunday;

  int get currentWeek => weekOfYear;

  int get weekYear => year;

  String get convertedToDanishMonthName {
    final currentMonth = switch (month) {
      1 => 'Januar',
      2 => 'Februar',
      3 => 'Marts',
      4 => 'April',
      5 => 'Maj',
      6 => 'Juni',
      7 => 'Juli',
      8 => 'August',
      9 => 'September',
      10 => 'Oktober',
      11 => 'November',
      12 => 'December',
      _ => '',
    };

    return '$currentMonth $year';
  }
}

extension DateTimeContextEx on BuildContext {
  Future<DateTime?> selectDate(
    String helperText, {
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) {
    final now = DateTime.now();

    return showDatePicker(
      context: this,
      helpText: helperText,
      initialDate: initialDate ?? now,
      firstDate: firstDate ?? now,
      lastDate: lastDate ?? now.add(const Duration(days: 90)),
    );
  }

  Future<TimeOfDay?> selectTime(String helpText) => showTimePicker(
        context: this,
        helpText: helpText,
        initialTime: TimeOfDay.now(),
      );

// Future<DateTime?> setDateAndTime({required String helpDateText,
//   required String helperTimeText,
//   DateTime? initialDate}) async {
//   final selectedDate = await selectDate(helpDateText, initialDate);
//   if (selectedDate != null) {
//     final selectedTime = await selectTime(helperTimeText) ?? TimeOfDay.now();
//     final dateTime = DateTime(selectedDate.year, selectedDate.month,
//         selectedDate.day, selectedTime.hour, selectedTime.minute);
//
//     return dateTime;
//   }
//   return null;
// }
}
