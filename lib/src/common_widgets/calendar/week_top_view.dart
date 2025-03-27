import 'package:flutter/material.dart';
import 'package:ordrestyring_common/ordrestyring_common.dart';
import 'package:ordrestyring_common/ordrestyring_common.dart' as tz
    show TZDateTime;

import 'week_view.dart';

class WeekTopView extends StatelessWidget {
  const WeekTopView({
    super.key,
    required this.totalWeeks,
    required this.startRangeDate,
  });

  final int totalWeeks;
  final tz.TZDateTime startRangeDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int index = 0; index < totalWeeks; index++)
          ...() {
            final weekStartRange = startRangeDate.add(
              Duration(days: 7 * index),
            );

            final validatedWeek = weekStartRange.currentWeekOfYear;
            final validatedYear = HelperMethod.getISOWeekYear(weekStartRange);

            final firstColumn = index == 0;
            final isFirstWeekOfMonth = HelperMethod.isFirstWeekOfMonth(
              validatedWeek,
              validatedYear,
            );

            final weekMonth = firstColumn || isFirstWeekOfMonth
                ? HelperMethod.getMonthFromWeekNumber(
                    validatedWeek,
                    validatedYear,
                  )
                : '';
            return [
              Expanded(
                child: WeekView(
                  week: validatedWeek,
                  year: validatedYear,
                  weekMonth: weekMonth,
                ),
              ),
            ];
          }(),
      ],
    );
  }
}
