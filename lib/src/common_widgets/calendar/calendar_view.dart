import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ordrestyring_common/ordrestyring_common.dart';
import 'package:ordrestyring_common/src/common_widgets/containers/app_icon_container.dart';
import 'package:ordrestyring_common/src/domain/assignment/calendar_wrapper.dart';
import 'package:ordrestyring_common/src/utils/case_extension.dart';

part 'assignment_dialog.dart';

part 'calendar_controller.dart';

part 'calendar_menu_dialog.dart';

part 'calendar_navigation_row.dart';

part 'calendar_user_notifier.dart';

class CalendarView extends HookConsumerWidget {
  const CalendarView({this.showNavigationArrows = true, super.key});

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
    final calendarWrappers = ref.watch(calendarWrapperProvider);
    if (calendarWrappers.isEmpty) return const SizedBox();

    final viewFirstDate = ref.watch(_startRangeProvider);
    final viewLastDate = ref.watch(_endRangeProvider);

    final wrappersInView = calendarWrappers.where((wrapper) {
      return wrapper.when(
        job: (job) {
          if (job.editorCalendar == null) return false;

          final editorCalendar = job.editorCalendar!;
          final overlapsWithView = editorCalendar.startDate
                  .isBefore(viewLastDate.add(const Duration(days: 1))) &&
              editorCalendar.endDate
                  .isAfter(viewFirstDate.subtract(const Duration(days: 1)));

          return overlapsWithView;
        },
        assignment: (assignment) {
          final calendar = assignment.calendar;
          // Include vacations that overlap with the current view range, including boundary days
          final overlapsWithView = calendar.startDate
                  .isBefore(viewLastDate.add(const Duration(days: 1))) &&
              calendar.endDate
                  .isAfter(viewFirstDate.subtract(const Duration(days: 1)));

          return overlapsWithView;
        },
      );
    }).toList();

    if (wrappersInView.isEmpty) return const SizedBox();

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
              children: wrappersInView.map((wrapper) {
                final adjustedViewFirstDate = DateTime(
                  viewFirstDate.year,
                  viewFirstDate.month,
                  viewFirstDate.day,
                );

                final List<ProduktionBar> bars = wrapper.when(
                  assignment: (assignment) {
                    final startDate = assignment.calendar.startDate;
                    final endDate = assignment.calendar.endDate;
                    final bar = calculateBar(
                      startDate: startDate,
                      endDate: assignment.calendar.endDate,
                      spacePerDay: spacePerDay,
                      adjustedViewFirstDate: adjustedViewFirstDate,
                    );
                    return [
                      ProduktionBar(
                        caseId: '',
                        projectName: assignment.name,
                        barColor: assignment.color.toColor,
                        barWidth: bar.$1,
                        leftPosition: bar.$2,
                        startDate: startDate,
                        endDate: endDate,
                        appointedUsers: const [],
                      )
                    ];
                  },
                  job: (caseItem) {
                    final bars = <ProduktionBar>[];

                    final editor = caseItem.editorCalendar!;

                    final editorBar = calculateBar(
                      startDate: editor.startDate,
                      endDate: editor.endDate,
                      spacePerDay: spacePerDay,
                      adjustedViewFirstDate: adjustedViewFirstDate,
                    );

                    bars.add(
                      ProduktionBar(
                        caseId: caseItem.caseNumber,
                        projectName: caseItem.projectName,
                        barColor:
                            caseItem.editorCalendar?.peopleColor?.toColor ??
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
                        startDate: calendar.startDate,
                        endDate: calendar.endDate,
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
                        caseItem.montageCalendar!.endDate
                            .isAfter(viewFirstDate)) {
                      final montage = caseItem.montageCalendar!;

                      final montageBar = calculateBar(
                        startDate: montage.startDate,
                        endDate: montage.endDate,
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
                    return bars;
                  },
                );

                return _Bar(
                  produktionBars: bars,
                  spacePerDay: spacePerDay,
                  viewFirstDate: adjustedViewFirstDate,
                  onTap: () => wrapper.when(
                    assignment: (a) => context.openDialog(
                      AssignmentDialog(assignment: a),
                    ),
                    job: (c) => context.openDialog(
                      CalendarMenuDialog(
                        caseItem: c,
                        dialogTopBar: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              'Opdater oplysninger i ordre: ${c.caseNumber}',
                              style: const TextStyle(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  (double, double) calculateBar({
    required DateTime startDate,
    required DateTime endDate,
    required double spacePerDay,
    required DateTime adjustedViewFirstDate,
  }) {
    // final startDate = calendar.startDate;
    // final endDate = calendar.endDate;

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
    required this.onTap,
  });

  final VoidCallback onTap;
  final List<ProduktionBar> produktionBars;
  final double spacePerDay;
  final DateTime viewFirstDate;

  ProduktionBar get editorBar => produktionBars.first;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 4.0), // Spacing between bars
        child: Container(
          margin: EdgeInsets.only(left: editorBar.leftPosition),
          width: editorBar.barWidth,
          decoration: BoxDecoration(
            color: editorBar.barColor.withValues(alpha: .3),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: produktionBars
                .map(
                  (bar) => LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
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
                          borderRadius: BorderRadius.circular(10),
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
                                          if (bar.caseId.isNotEmpty)
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
                                          backgroundColor: _getLighterShade(
                                              bar.barColor, 0.2),
                                          radius: 12,
                                          child: FittedBox(
                                            child: CaptionText(user.initials),
                                          ),
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
