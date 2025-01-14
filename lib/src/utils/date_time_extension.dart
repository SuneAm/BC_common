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

  String get formatDateShort {
    final dateFormat = DateFormat('d MMM'); // 30 Nov
    return dateFormat.format(this);
  }

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

  int get currentWeekOfYear => weekOfYear;

  String get convertedToDanishMonthName => switch (month) {
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
}

extension DateTimeRangeEx on DateTimeRange {
  String get formattedDates => '${start.formatDateShort}, ${end.formatDate}';
}

extension DateTimeContextEx on BuildContext {
  int get _lastDate => 1096; // 3 years

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
      lastDate: lastDate ?? now.add(Duration(days: _lastDate)),
    );
  }

  Future<DateTimeRange?> selectDateRange(
    String helperText, {
    DateTime? firstDate,
    DateTime? lastDate,
    DateTimeRange? initialDateRange,
  }) {
    final now = DateTime.now();

    return showDateRangePicker(
        context: this,
        helpText: helperText,
        initialDateRange: initialDateRange,
        firstDate: firstDate ?? now,
        lastDate: lastDate ?? now.add(Duration(days: _lastDate)),
        builder: (_, child) {
          return Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 800,
                    maxWidth: 700,
                  ),
                  child: child,
                ),
              ),
            ],
          );
        });
  }

  Future<TimeOfDay?> selectTime(String helpText) => showTimePicker(
        context: this,
        helpText: helpText,
        initialTime: TimeOfDay.now(),
      );
}
