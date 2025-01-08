part of 'produktion_calendar_view.dart';

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
        _ProduktionZoomLevel.level4 => _ProduktionZoomLevel.level5,
        _ProduktionZoomLevel.level5 => _ProduktionZoomLevel.level5,
      };

  // Get the next zoom level
  _ProduktionZoomLevel get previous => switch (this) {
        _ProduktionZoomLevel.level1 => _ProduktionZoomLevel.level1,
        _ProduktionZoomLevel.level2 => _ProduktionZoomLevel.level1,
        _ProduktionZoomLevel.level3 => _ProduktionZoomLevel.level2,
        _ProduktionZoomLevel.level4 => _ProduktionZoomLevel.level3,
        _ProduktionZoomLevel.level5 => _ProduktionZoomLevel.level4,
      };
}

final calendarWrapperProvider =
    Provider.autoDispose<List<CalendarWrapper>>((ref) {
  final calendarCases = ref.watch(calendarCasesNotifierProvider);
  final assignments = ref.watch(assignmentsProvider);
  return [
    ...calendarCases.map((c) => CalendarWrapper.job(c)),
    ...assignments.map((a) => CalendarWrapper.assignment(a)),
  ];
});
