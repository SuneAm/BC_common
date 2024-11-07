import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ordrestyring_common/ordrestyring_common.dart';

class WeekView extends StatelessWidget {
  const WeekView({
    super.key,
    required this.week,
    required this.year,
    required this.weekMonth,
  });

  final int week;
  final int year;
  final String weekMonth;

  @override
  Widget build(BuildContext context) {
    final borderColor = Colors.grey.shade300;

    return Column(
      children: [
        ColoredBox(
          color: Colors.grey.shade400,
          child: SizedBox(
            height: 32,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: weekMonth.isEmpty ? 4.0 : 4.5,
                      horizontal: 2,
                    ),
                    child: AutoSizeText(
                      weekMonth,
                      maxLines: 1,
                      minFontSize: 8,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: AppContainer(
            border: Border.all(color: borderColor),
            borderRadius: null,
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      'Week $week',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (final day
                          in HelperMethod.getWeekdaysFromWeekNumber(week, year))
                        Expanded(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              border: Border(
                                right: day.weekday == DateTime.sunday
                                    ? BorderSide.none
                                    : BorderSide(color: borderColor),
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      right: day.weekday == DateTime.sunday
                                          ? BorderSide.none
                                          : BorderSide(color: borderColor),
                                      top: BorderSide(color: borderColor),
                                      bottom: BorderSide(color: borderColor),
                                    ),
                                    color: (day.weekday == DateTime.sunday ||
                                            day.weekday == DateTime.saturday)
                                        ? Colors.grey.shade100
                                        : day.isToday
                                            ? OrdrerColors.kEditorColor
                                            : null,
                                  ),
                                  child: Center(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        DateFormat('d').format(day),
                                      ),
                                    ),
                                  ),
                                ),
                                if (day.isToday ||
                                    day.weekday == DateTime.saturday ||
                                    day.weekday == DateTime.sunday)
                                  Expanded(
                                    child: SizedBox.expand(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 1,
                                        ),
                                        child: ColoredBox(
                                          color: day.isToday
                                              ? OrdrerColors.kEditorColor
                                              : Colors.grey.shade100,
                                        ),
                                      ),
                                    ),
                                  )
                              ],
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
