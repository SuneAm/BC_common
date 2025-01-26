part of 'calendar_view.dart';

final calendarCasesProvider = Provider<List<Case>>((ref) {
  return ref
      .watch(casesProvider)
      .where((e) => e.useInCalendar ?? false)
      .toList();
});

final calendarCasesNotifierProvider =
    StateNotifierProvider<CasesStateNotifier, List<Case>>(
  (ref) => CasesStateNotifier(ref.watch(calendarCasesProvider)),
);

final _startRangeProvider = StateProvider.autoDispose<DateTime>(
  (ref) => HelperMethod.getStartOfCurrentWeek(),
);

final _endRangeProvider = Provider.autoDispose<DateTime>((ref) {
  final startRange = ref.watch(_startRangeProvider);
  final ferieZoomLevel = ref.watch(_produktionZoomLevelProvider);
  return startRange.add(
    Duration(
      days: ferieZoomLevel.totalWeeks * 7,
    ),
  );
});

final _produktionZoomLevelProvider =
    StateProvider.autoDispose<_ProduktionZoomLevel>(
  (_) => _ProduktionZoomLevel.level3,
);

enum _ProduktionZoomLevel {
  level1(3),
  level2(6),
  level3(9),
  level4(12),
  level5(14),
  ;

  const _ProduktionZoomLevel(this.totalWeeks);

  final int totalWeeks;

  // Get the next zoom level
  _ProduktionZoomLevel get next => switch (this) {
        _ProduktionZoomLevel.level1 => _ProduktionZoomLevel.level2,
        _ProduktionZoomLevel.level2 => _ProduktionZoomLevel.level3,
        _ProduktionZoomLevel.level3 => _ProduktionZoomLevel.level4,
        _ => _ProduktionZoomLevel.level5,
      };

  // Get the previous zoom level
  _ProduktionZoomLevel get previous => switch (this) {
        _ProduktionZoomLevel.level3 => _ProduktionZoomLevel.level2,
        _ProduktionZoomLevel.level4 => _ProduktionZoomLevel.level3,
        _ProduktionZoomLevel.level5 => _ProduktionZoomLevel.level4,
        _ => _ProduktionZoomLevel.level1,
      };
}

// ********** Sort By ************
enum CalendarSortBy {
  projectNumber('Project Number'),
  startDate('Start Date'),
  endDate('End Date'),
  lengthOfProject('Length Of project'),
  ;

  const CalendarSortBy(this.title);

  final String title;
}

final calendarSortByProvider = StateProvider.autoDispose<CalendarSortBy>(
  (ref) => CalendarSortBy.projectNumber,
);

final _calendarCaseSortByProvider = Provider<List<Case>>((ref) {
  final calendarCases = ref.watch(calendarCasesNotifierProvider);
  final sortBy = ref.watch(calendarSortByProvider);

  // Create a copy of the list to avoid side effects
  final sortedCases = [...calendarCases];

  switch (sortBy) {
    case CalendarSortBy.projectNumber:
      break; // No sorting required, return as is
    case CalendarSortBy.startDate:
      sortedCases.sortByStartDate;
      break;
    case CalendarSortBy.endDate:
      sortedCases.sortByEndDate;
      break;
    case CalendarSortBy.lengthOfProject:
      sortedCases.sortByLengthOfProject;
      break;
  }

  return sortedCases;
});

final calendarWrapperProvider =
    Provider.autoDispose<List<CalendarWrapper>>((ref) {
  final calendarCases = ref.watch(_calendarCaseSortByProvider);
  final assignments = ref.watch(assignmentsProvider);
  return [
    ...calendarCases.map((c) => CalendarWrapper.job(c)),
    ...assignments.map((a) => CalendarWrapper.assignment(a)),
  ];
});

final calendarWrapperInViewProvider =
    Provider.autoDispose<List<CalendarWrapper>>((ref) {
  final calendarWrappers = ref.watch(calendarWrapperProvider);
  final viewFirstDate = ref.watch(_startRangeProvider);
  final viewLastDate = ref.watch(_endRangeProvider);

  return calendarWrappers.where((wrapper) {
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
        final overlapsWithView = calendar.startDate
                .isBefore(viewLastDate.add(const Duration(days: 1))) &&
            calendar.endDate
                .isAfter(viewFirstDate.subtract(const Duration(days: 1)));

        return overlapsWithView;
      },
    );
  }).toList();
});
