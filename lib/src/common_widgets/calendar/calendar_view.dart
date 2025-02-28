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
                fit: StackFit.expand,
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
    final wrappersInView = ref.watch(calendarWrapperInViewProvider);
    if (wrappersInView.isEmpty) return const SizedBox();

    final viewFirstDate = ref.watch(_startRangeProvider);
    final viewLastDate = ref.watch(_endRangeProvider);

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

                final _CalendarBar bars = wrapper.when(
                  assignment: (assignment) {
                    final startDate = assignment.calendar.startDate;
                    final endDate = assignment.calendar.endDate;
                    final bar = calculateBar(
                      startDate: startDate,
                      endDate: endDate,
                      spacePerDay: spacePerDay,
                      adjustedViewFirstDate: adjustedViewFirstDate,
                    );

                    final parentView = _CalendarViewBar(
                      name: assignment.name,
                      barColor: assignment.calendar.color?.toColor ??
                          DateCalendarColor.blue.toColor,
                      barWidth: bar.$1,
                      leftPosition: bar.$2,
                      dateRange: DateTimeRange(
                        start: startDate,
                        end: endDate,
                      ),
                    );
                    return _CalendarBar(
                      parentViewBar: parentView,
                      assignmentBar: _CalendarAssignmentBar(
                        assignment: assignment,
                        viewBar: parentView,
                      ),
                    );
                  },
                  job: (caseItem) {
                    final caseBars = <_CalendarCaseBar>[];

                    final editor = caseItem.editorCalendar!;

                    final editorBar = calculateBar(
                      startDate: editor.startDate,
                      endDate: editor.endDate,
                      spacePerDay: spacePerDay,
                      adjustedViewFirstDate: adjustedViewFirstDate,
                    );

                    final editorViewBar = _CalendarViewBar(
                      name: caseItem.projectName,
                      barColor: caseItem.editorCalendar?.color?.toColor ??
                          OrdrerColors.kEditorColor,
                      barWidth: editorBar.$1,
                      leftPosition: editorBar.$2,
                      isCollapsable: true,
                      dateRange: DateTimeRange(
                        start: editor.startDate,
                        end: editor.endDate,
                      ),
                    );

                    final editorCaseBar = _CalendarCaseBar(
                      caseId: caseItem.caseNumber,
                      appointedUsers: const [],
                      viewBar: editorViewBar,
                      progress: caseItem.editorCalendar?.progress,
                    );

                    caseBars.add(editorCaseBar);

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

                      caseBars.add(
                        _CalendarCaseBar(
                          caseId: caseItem.caseNumber,
                          appointedUsers: caseItem.productionUsers ?? [],
                          viewBar: _CalendarViewBar(
                            name: '',
                            barColor: OrdrerColors.kProduktionAppColor,
                            barWidth: calendarBar.$1,
                            leftPosition: calendarBar.$2,
                            dateRange: DateTimeRange(
                              start: calendar.startDate,
                              end: calendar.endDate,
                            ),
                          ),
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

                      caseBars.add(
                        _CalendarCaseBar(
                          caseId: caseItem.caseNumber,
                          appointedUsers: caseItem.montageUsers ?? [],
                          viewBar: _CalendarViewBar(
                            name: '',
                            barColor: OrdrerColors.kMontageAppColor,
                            barWidth: montageBar.$1,
                            leftPosition: montageBar.$2,
                            dateRange: DateTimeRange(
                              start: montage.startDate,
                              end: montage.endDate,
                            ),
                          ),
                        ),
                      );
                    }
                    // return caseBars;

                    return _CalendarBar(
                      parentViewBar: editorViewBar,
                      caseBars: caseBars,
                    );
                  },
                );

                return _Bar(
                  calendarBar: bars,
                  spacePerDay: spacePerDay,
                  viewFirstDate: adjustedViewFirstDate,
                  onTap: () => wrapper.when(
                    assignment: (a) => context.openDialog(
                      AssignmentDialog(assignment: a),
                    ),
                    job: (c) => context.openDialog(
                      CalendarMenuDialog(caseItem: c),
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

class _Bar extends HookConsumerWidget {
  const _Bar({
    required this.calendarBar,
    required this.spacePerDay,
    required this.viewFirstDate,
    required this.onTap,
  });

  final VoidCallback onTap;
  final _CalendarBar calendarBar;
  final double spacePerDay;
  final DateTime viewFirstDate;

  _CalendarViewBar get parentViewBar => calendarBar.parentViewBar;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 4.0), // Spacing between bars
        child: (calendarBar.assignmentBar != null)
            ? _CalendarAssignmentContainer(
                assignmentBar: calendarBar.assignmentBar!,
                spacePerDay: spacePerDay,
              )
            : _CalendarCaseContainer(
                calendarBar: calendarBar,
                spacePerDay: spacePerDay,
              ),
      ),
    );
  }
}

class _CalendarAssignmentContainer extends StatelessWidget {
  const _CalendarAssignmentContainer({
    required this.assignmentBar,
    required this.spacePerDay,
  });

  final _CalendarAssignmentBar assignmentBar;
  final double spacePerDay;

  _CalendarViewBar get viewBar => assignmentBar.viewBar;

  bool get isMilestone => assignmentBar.assignment.type.isMilestone;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: viewBar.leftPosition),
      width: isMilestone ? null : viewBar.barWidth,
      child: switch (assignmentBar.assignment.type) {
        AssignmentType.milestone => Row(
            children: [
              Consumer(
                builder: (_, WidgetRef ref, __) {
                  final zoomLevel = ref.watch(_produktionZoomLevelProvider);
                  return Icon(
                    Icons.hexagon,
                    color: assignmentBar.viewBar.barColor,
                    size: switch (zoomLevel) {
                      _ProduktionZoomLevel.level1 ||
                      _ProduktionZoomLevel.level2 ||
                      _ProduktionZoomLevel.level3 =>
                        24,
                      _ => viewBar.barWidth,
                    },
                  );
                },
              ),
              SizedBox(width: 4),
              Text(
                assignmentBar.assignment.name,
                style: TextStyle(fontWeight: FontWeight.w600),
              )
            ],
          ),
        AssignmentType.assignment => _CalendarBarContainer(
            viewBar: viewBar,
            spacePerDay: spacePerDay,
            parentDateRange: viewBar.dateRange,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 2,
                horizontal: 8,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  vertical: 1.0,
                ),
                child: Text(viewBar.name),
              ),
            ),
          ),
      },
    );
  }
}

class _CalendarCaseContainer extends HookConsumerWidget {
  const _CalendarCaseContainer({
    required this.calendarBar,
    required this.spacePerDay,
  });

  final _CalendarBar calendarBar;
  final double spacePerDay;

  _CalendarViewBar get parentViewBar => calendarBar.parentViewBar;

  Color _getLighterShade(Color color, double factor) {
    HSLColor hsl = HSLColor.fromColor(color);
    return hsl
        .withLightness((hsl.lightness + factor).clamp(0.0, 1.0))
        .toColor();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toggleBar = useState<bool>(false);

    return Container(
      margin: EdgeInsets.only(left: parentViewBar.leftPosition),
      width: parentViewBar.barWidth,
      decoration: BoxDecoration(
        color: parentViewBar.barColor.withValues(alpha: .3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: calendarBar.caseBars == null
          ? const SizedBox()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: calendarBar.caseBars!.map((caseBar) {
                final viewBar = caseBar.viewBar;
                if (!viewBar.isCollapsable && toggleBar.value) {
                  return const SizedBox();
                }

                final parentDateRange = parentViewBar.dateRange;
                final progress = caseBar.progress;

                return _CalendarBarContainer(
                  viewBar: viewBar,
                  spacePerDay: spacePerDay,
                  parentDateRange: parentDateRange,
                  child: Stack(
                    children: [
                      if (progress != null)
                        Positioned.fill(
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: progress.clamp(0.0, 1.0),
                            // Ensuring the value is between 0 and 1
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      Row(
                        children: [
                          Expanded(
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
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: '${caseBar.caseId} - ',
                                                style: const TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              TextSpan(text: viewBar.name),
                                            ],
                                          ),
                                        ),
                                        ...caseBar.appointedUsers.map(
                                          (user) => Padding(
                                            padding:
                                                const EdgeInsets.only(left: 2),
                                            child: CircleAvatar(
                                              backgroundColor: _getLighterShade(
                                                  viewBar.barColor, 0.2),
                                              radius: 12,
                                              child: FittedBox(
                                                child:
                                                    CaptionText(user.initials),
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
                          ),
                          if (viewBar.isCollapsable)
                            Consumer(
                              builder: (_, WidgetRef ref, __) {
                                final zoomLevel =
                                    ref.watch(_produktionZoomLevelProvider);

                                return IconContainer(
                                  icon: toggleBar.value
                                      ? Icons.arrow_upward
                                      : Icons.arrow_downward,
                                  size: switch (zoomLevel) {
                                    _ProduktionZoomLevel.level1 ||
                                    _ProduktionZoomLevel.level2 ||
                                    _ProduktionZoomLevel.level3 =>
                                      16,
                                    _ => spacePerDay,
                                  },
                                  padding: viewBar.barWidth == spacePerDay
                                      ? EdgeInsets.zero
                                      : const EdgeInsets.all(4.0),
                                  onTap: () =>
                                      toggleBar.value = !toggleBar.value,
                                );
                              },
                            ),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
    );
  }
}

class _CalendarBarContainer extends ConsumerWidget {
  const _CalendarBarContainer({
    required this.viewBar,
    required this.spacePerDay,
    required this.child,
    required this.parentDateRange,
  });

  final _CalendarViewBar viewBar;
  final double spacePerDay;
  final Widget child;
  final DateTimeRange parentDateRange;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewStartRange = ref.watch(_startRangeProvider);

    final viewFirstDate = DateTime(
      viewStartRange.year,
      viewStartRange.month,
      viewStartRange.day,
    );

    final adjustedViewFirstDate = parentDateRange.start.isBefore(viewFirstDate)
        ? viewFirstDate
        : DateTime(
            parentDateRange.start.year,
            parentDateRange.start.month,
            parentDateRange.start.day,
          );

    // Calculate effective start and end days within the current view range

    final barDateRange = viewBar.dateRange;
    final adjustedStartDate = barDateRange.start.isBefore(adjustedViewFirstDate)
        ? adjustedViewFirstDate
        : DateTime(
            barDateRange.start.year,
            barDateRange.start.month,
            barDateRange.start.day,
          );

    final adjustedEndDate = DateTime(
      barDateRange.end.year,
      barDateRange.end.month,
      barDateRange.end.day,
    );

    final startDayIndex =
        adjustedStartDate.difference(adjustedViewFirstDate).inDays;
    final endDayIndex =
        adjustedEndDate.difference(adjustedViewFirstDate).inDays;

    // Calculate the left position based on the start day index and width for each day
    final leftPosition = spacePerDay * startDayIndex;

    // // // Calculate the width of the bar based on the total number of days the vacation spans
    final barWidth = spacePerDay * (endDayIndex - startDayIndex + 1);
    return Container(
      margin: EdgeInsets.only(left: leftPosition),
      width: barWidth,
      decoration: BoxDecoration(
        color: viewBar.barColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}

@immutable
class _CalendarViewBar {
  const _CalendarViewBar({
    required this.name,
    required this.barColor,
    required this.barWidth,
    required this.leftPosition,
    required this.dateRange,
    this.isCollapsable = false,
  });

  final String name;
  final Color barColor;
  final double barWidth;
  final double leftPosition;
  final DateTimeRange dateRange;
  final bool isCollapsable;
}

@immutable
class _CalendarBar {
  const _CalendarBar({
    required this.parentViewBar,
    this.caseBars,
    this.assignmentBar,
  });

  final _CalendarViewBar parentViewBar;
  final List<_CalendarCaseBar>? caseBars;
  final _CalendarAssignmentBar? assignmentBar;
}

@immutable
class _CalendarCaseBar {
  const _CalendarCaseBar({
    required this.caseId,
    required this.appointedUsers,
    required this.viewBar,
    this.progress,
  });

  final String caseId;
  final double? progress;
  final List<UserInfo> appointedUsers;
  final _CalendarViewBar viewBar;
}

@immutable
class _CalendarAssignmentBar {
  const _CalendarAssignmentBar({
    required this.assignment,
    required this.viewBar,
  });

  final Assignment assignment;
  final _CalendarViewBar viewBar;
}
