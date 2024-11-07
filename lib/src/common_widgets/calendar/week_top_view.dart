import 'package:flutter/material.dart';
import 'package:ordrestyring_common/ordrestyring_common.dart';

import 'week_view.dart';

class WeekTopView extends StatelessWidget {
  const WeekTopView({
    super.key,
    required this.totalWeeks,
    required this.startRangeDate,
  });

  final int totalWeeks;
  final DateTime startRangeDate;

  int get currentWeek => startRangeDate.currentWeek;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int index = 0; index < totalWeeks; index++)
          ...() {
            final weekToShow = currentWeek + index;
            final (validatedWeek, validatedYear) =
                HelperMethod.getValidWeekNumber(
              weekToShow,
              startRangeDate.year,
            );

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
