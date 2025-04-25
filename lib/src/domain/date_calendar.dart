import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timezone/timezone.dart' as tz;

import 'package:ordrestyring_common/src/utils/serializers/time_stamp_serializer.dart';

part 'date_calendar.freezed.dart';
part 'date_calendar.g.dart';

enum DateCalendarColor {
  blue([154, 199, 244]),
  turquoise([82, 181, 159]),
  green([99, 203, 101]),
  yellow([232, 218, 101]),
  brown([188, 136, 97]),
  red([255, 97, 97]),
  pink([255, 118, 212]),
  marine([101, 125, 255]),
  purple([164, 104, 255]);

  const DateCalendarColor(this.rgb);

  final List<int> rgb;

  Color get toColor => Color.fromARGB(255, rgb.first, rgb[1], rgb.last);
}

@freezed
class DateCalendar with _$DateCalendar {
  const factory DateCalendar({
    @TimestampSerializer() required tz.TZDateTime startDate,
    @TimestampSerializer() required tz.TZDateTime endDate,
    DateCalendarColor? color,
    double? progress,
  }) = _DateCalendar;

  factory DateCalendar.fromJson(Map<String, dynamic> json) =>
      _$DateCalendarFromJson(json);
}
