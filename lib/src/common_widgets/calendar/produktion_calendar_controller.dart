part of 'produktion_calendar_view.dart';

final produktionCalendarCases = Provider.autoDispose<List<Case>>((ref) {
  final value = ref.watch(watchCasesProvider);

  final cases = value.value ?? [];
  return cases.where((element) => element.useInCalendar ?? false).toList();
});

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
