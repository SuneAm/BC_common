import 'package:flutter/material.dart';
import 'package:ordrestyring_common/src/styles/ordrer_colors.dart';

extension PeopleColorEx on CalendarColor {
  Color get toColor => Color.fromARGB(255, rgb.first, rgb[1], rgb.last);
}
