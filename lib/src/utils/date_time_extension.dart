import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:week_of_year/week_of_year.dart';
import 'package:timezone/timezone.dart' as tz;

import 'help_methods.dart';

extension DateTimeExtension on tz.TZDateTime {
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
    if (day == TimeZoneHelper.nowInCopenhagen().day) {
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

  bool get isSameWeek =>
      TimeZoneHelper.nowInCopenhagen().difference(this).inDays < 7;

  tz.TZDateTime combineDateTime(TimeOfDay time) => TimeZoneHelper.setDateTime(
        date: this,
        hour: time.hour,
        minute: time.minute,
      );

  String customFormat(String format) => DateFormat(format).format(this);

  bool get isToday {
    final today = TimeZoneHelper.nowInCopenhagen();
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

extension DateTimeRangeEx on TZDateTimeRange {
  String get formattedDates => '${start.formatDateShort}, ${end.formatDate}';
}

extension DateTimeContextEx on BuildContext {
  int get _fistDate => 365; // 1 year
  int get _lastDate => 1096; // 3 years

  Future<tz.TZDateTime?> selectDate(
    String helperText, {
    tz.TZDateTime? initialDate,
    tz.TZDateTime? firstDate,
    tz.TZDateTime? lastDate,
  }) {
    final today = tz.TZDateTime.now(TimeZoneHelper.denmarkTimeZone);

    return showDatePicker(
      context: this,
      helpText: helperText,
      initialDate: initialDate?.toLocal() ?? today,
      firstDate:
          firstDate?.toLocal() ?? today.subtract(Duration(days: _fistDate)),
      lastDate: lastDate?.toLocal() ?? today.add(Duration(days: _lastDate)),
    ).then((date) => date != null
        ? tz.TZDateTime.from(date, TimeZoneHelper.denmarkTimeZone)
        : null);
  }

  Future<TZDateTimeRange?> selectDateRange(
    String helperText, {
    tz.TZDateTime? firstDate,
    tz.TZDateTime? lastDate,
    TZDateTimeRange? initialDateRange,
  }) {
    final today = TimeZoneHelper.nowInCopenhagen();

    return showDateRangePicker(
      context: this,
      helpText: helperText,
      initialDateRange: initialDateRange != null
          ? DateTimeRange(
              start: initialDateRange.start.toLocal(),
              end: initialDateRange.end.toLocal(),
            )
          : null,
      firstDate: firstDate ?? today.subtract(Duration(days: _fistDate)),
      lastDate: lastDate ?? today.add(Duration(days: _lastDate)),
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
      },
    ).then((range) => range != null
        ? TZDateTimeRange(
            start: tz.TZDateTime(
              TimeZoneHelper.denmarkTimeZone,
              range.start.year,
              range.start.month,
              range.start.day,
              range.start.hour,
              range.start.minute,
            ),
            end: tz.TZDateTime(
              TimeZoneHelper.denmarkTimeZone,
              range.end.year,
              range.end.month,
              range.end.day,
              range.end.hour,
              range.end.minute,
            ),
          )
        : null);
  }

  Future<TimeOfDay?> selectTime(String helpText) => showTimePicker(
        context: this,
        helpText: helpText,
        initialTime: TimeOfDay.now(),
      );
}
