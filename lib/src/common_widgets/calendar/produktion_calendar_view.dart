import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ordrestyring_common/ordrestyring_common.dart';
import 'package:ordrestyring_common/src/common_widgets/containers/app_icon_container.dart';

part 'produktion_calendar_controller.dart';

part 'produktion_calendar_navigation_row.dart';

class ProduktionCalendarView extends HookConsumerWidget {
  const ProduktionCalendarView({this.showNavigationArrows = true, super.key});

  final bool showNavigationArrows;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final zoomLevel = ref.watch(_produktionZoomLevelProvider);
    final startRangeDate = ref.watch(_startRangeProvider);

    final isShiftPressed = useState<bool>(false);

    return ShiftScrollListener(
      onKeyEvent: (event) {
        if (event is KeyDownEvent &&
            event.logicalKey == LogicalKeyboardKey.shiftLeft) {
          isShiftPressed.value = true;
        } else if (event is KeyUpEvent &&
            event.logicalKey == LogicalKeyboardKey.shiftLeft) {
          isShiftPressed.value = false;
        }
      },
      onPointerSignal: (event) {
        if (!isShiftPressed.value) return;
        if (event is PointerScrollEvent) {
          final yScroll = event.scrollDelta.dy;
          final currentStartRange = ref.read(_startRangeProvider);
          late final DateTime newRange;
          const duration = Duration(days: 7);

          if (yScroll <= 0) {
            newRange = currentStartRange.add(duration);
          } else if (yScroll > 0) {
            newRange = currentStartRange.subtract(duration);
          } else {
            newRange = currentStartRange;
          }
          ref.read(_startRangeProvider.notifier).state = newRange;
        }
      },
      child: ColoredBox(
        color: Colors.white,
        child: Column(
          children: [
            if (showNavigationArrows) const ProduktionCalendarNavigationRow(),
            Expanded(
              child: Stack(
                children: [
                  WeekTopView(
                    totalWeeks: zoomLevel.totalWeeks,
                    startRangeDate: startRangeDate,
                  ),
                  const _BarAcrossColumns(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BarAcrossColumns extends ConsumerWidget {
  const _BarAcrossColumns();

  // months height + weeks height + days height
  double get topMargin => 32 + 20 + 30.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cases = ref.watch(produktionCasesNotifierProvider);
    if (cases.isEmpty) return const SizedBox();

    final viewFirstDate = ref.watch(_startRangeProvider);
    final viewLastDate = ref.watch(_endRangeProvider);

    final editorCases = cases.where((e) => e.editorCalendar != null).toList();

    final casesInView = editorCases.where((e) {
      final editorCalendar = e.editorCalendar!;
      // Include vacations that overlap with the current view range, including boundary days
      final overlapsWithView = editorCalendar.startDate
              .isBefore(viewLastDate.add(const Duration(days: 1))) &&
          editorCalendar.endDate
              .isAfter(viewFirstDate.subtract(const Duration(days: 1)));

      return overlapsWithView;
    }).toList();

    if (casesInView.isEmpty) return const SizedBox();

    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidthInView = constraints.maxWidth;

        // Calculate the total number of days in the view range
        final totalDaysInView = viewLastDate.difference(viewFirstDate).inDays;

        // Calculate the space allocated for each day
        final spacePerDay = maxWidthInView / totalDaysInView;

        return Container(
          width: maxWidthInView,
          margin: EdgeInsets.only(top: topMargin),
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: casesInView.map((caseItem) {
                final adjustedViewFirstDate = DateTime(
                  viewFirstDate.year,
                  viewFirstDate.month,
                  viewFirstDate.day,
                );

                final bars = <ProduktionBar>[];

                final editor = caseItem.editorCalendar!;

                final editorBar = calculateBar(
                  calendar: editor,
                  spacePerDay: spacePerDay,
                  adjustedViewFirstDate: adjustedViewFirstDate,
                );

                bars.add(
                  ProduktionBar(
                    caseId: caseItem.caseNumber,
                    projectName: caseItem.projectName,
                    barColor: caseItem.editorCalendar?.peopleColor?.toColor ??
                        OrdrerColors.kEditorColor,
                    barWidth: editorBar.$1,
                    leftPosition: editorBar.$2,
                    startDate: editor.startDate,
                    endDate: editor.endDate,
                    appointedUsers: const [],
                  ),
                );

                if (caseItem.productionCalendar != null &&
                    caseItem.productionCalendar!.endDate
                        .isAfter(viewFirstDate)) {
                  final calendar = caseItem.productionCalendar!;

                  final calendarBar = calculateBar(
                    calendar: calendar,
                    spacePerDay: spacePerDay,
                    adjustedViewFirstDate: adjustedViewFirstDate,
                  );

                  bars.add(
                    ProduktionBar(
                      caseId: caseItem.caseNumber,
                      projectName: '',
                      barColor: OrdrerColors.kProduktionAppColor,
                      barWidth: calendarBar.$1,
                      leftPosition: calendarBar.$2,
                      startDate: calendar.startDate,
                      endDate: calendar.endDate,
                      appointedUsers: caseItem.productionUsers ?? [],
                    ),
                  );
                }

                if (caseItem.montageCalendar != null &&
                    caseItem.montageCalendar!.endDate.isAfter(viewFirstDate)) {
                  final montage = caseItem.montageCalendar!;

                  final montageBar = calculateBar(
                    calendar: montage,
                    spacePerDay: spacePerDay,
                    adjustedViewFirstDate: adjustedViewFirstDate,
                  );

                  bars.add(
                    ProduktionBar(
                      caseId: caseItem.caseNumber,
                      projectName: '',
                      barColor: OrdrerColors.kMontageAppColor,
                      barWidth: montageBar.$1,
                      leftPosition: montageBar.$2,
                      startDate: montage.startDate,
                      endDate: montage.endDate,
                      appointedUsers: caseItem.montageUsers ?? [],
                    ),
                  );
                }

                return _Bar(
                  produktionBars: bars,
                  spacePerDay: spacePerDay,
                  viewFirstDate: adjustedViewFirstDate,
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  (double, double) calculateBar({
    required CaseCalendar calendar,
    required double spacePerDay,
    required DateTime adjustedViewFirstDate,
  }) {
    final startDate = calendar.startDate;
    final endDate = calendar.endDate;

    // Calculate effective start and end days within the current view range
    final adjustedStartDate = startDate.isBefore(adjustedViewFirstDate)
        ? adjustedViewFirstDate
        : DateTime(
            startDate.year,
            startDate.month,
            startDate.day,
          );

    final adjustedEndDate = DateTime(
      endDate.year,
      endDate.month,
      endDate.day,
    );

    final startDayIndex =
        adjustedStartDate.difference(adjustedViewFirstDate).inDays;
    final endDayIndex =
        adjustedEndDate.difference(adjustedViewFirstDate).inDays;

    // Calculate the left position based on the start day index and width for each day
    final leftPosition = spacePerDay * startDayIndex;
    // final adjustedLeftPosition = leftPosition < 0.0 ? 0.0 : leftPosition;

    // Calculate the width of the bar based on the total number of days the vacation spans
    final barWidth = spacePerDay * (endDayIndex - startDayIndex + 1);

    return (barWidth, leftPosition);
  }
}

class _Bar extends StatelessWidget {
  const _Bar({
    required this.produktionBars,
    required this.spacePerDay,
    required this.viewFirstDate,
  });

  final List<ProduktionBar> produktionBars;
  final double spacePerDay;
  final DateTime viewFirstDate;

  ProduktionBar get editorBar => produktionBars.first;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0), // Spacing between bars
      child: Container(
        margin: EdgeInsets.only(left: editorBar.leftPosition),
        width: editorBar.barWidth,
        decoration: BoxDecoration(
          // color: const Color.fromARGB(100, 187, 222, 251)
          color: editorBar.barColor.withOpacity(.3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: produktionBars
              .map(
                (bar) => LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final adjustedViewFirstDate =
                        editorBar.startDate.isBefore(viewFirstDate)
                            ? viewFirstDate
                            : DateTime(
                                editorBar.startDate.year,
                                editorBar.startDate.month,
                                editorBar.startDate.day,
                              );

                    // Calculate effective start and end days within the current view range
                    final adjustedStartDate =
                        bar.startDate.isBefore(adjustedViewFirstDate)
                            ? adjustedViewFirstDate
                            : DateTime(
                                bar.startDate.year,
                                bar.startDate.month,
                                bar.startDate.day,
                              );

                    final adjustedEndDate = DateTime(
                      bar.endDate.year,
                      bar.endDate.month,
                      bar.endDate.day,
                    );

                    final startDayIndex = adjustedStartDate
                        .difference(adjustedViewFirstDate)
                        .inDays;
                    final endDayIndex = adjustedEndDate
                        .difference(adjustedViewFirstDate)
                        .inDays;

                    // Calculate the left position based on the start day index and width for each day
                    final leftPosition = spacePerDay * startDayIndex;

                    // // // Calculate the width of the bar based on the total number of days the vacation spans
                    final barWidth =
                        spacePerDay * (endDayIndex - startDayIndex + 1);

                    return Container(
                      margin: EdgeInsets.only(left: leftPosition),
                      width: barWidth,
                      decoration: BoxDecoration(
                        color: bar.barColor,
                        borderRadius: BorderRadius.circular(
                            10), // Adjust the radius as needed
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 8,
                        ),
                        child: Wrap(
                          runSpacing: 6,
                          spacing: 6,
                          children: [
                            SingleChildScrollView(
                              padding: const EdgeInsets.symmetric(
                                vertical: 1.0,
                              ),
                              scrollDirection: Axis.horizontal,
                              child: Wrap(
                                spacing: 1.5,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '${bar.caseId} - ',
                                          style: const TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(text: bar.projectName),
                                      ],
                                    ),
                                  ),
                                  ...bar.appointedUsers.map(
                                    (user) => Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: CircleAvatar(
                                        backgroundColor:
                                            _getLighterShade(bar.barColor, 0.2),
                                        radius: 12,
                                        child: CaptionText(user.initials),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Color _getLighterShade(Color color, double factor) {
    HSLColor hsl = HSLColor.fromColor(color);
    return hsl
        .withLightness((hsl.lightness + factor).clamp(0.0, 1.0))
        .toColor();
  }
}

@immutable
class ProduktionBar {
  const ProduktionBar({
    required this.caseId,
    required this.projectName,
    required this.barColor,
    required this.barWidth,
    required this.leftPosition,
    required this.startDate,
    required this.endDate,
    required this.appointedUsers,
  });

  final String caseId;
  final String projectName;
  final Color barColor;
  final double barWidth;
  final double leftPosition;
  final DateTime startDate;
  final DateTime endDate;
  final List<User> appointedUsers;
}
