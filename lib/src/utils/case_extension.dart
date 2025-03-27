import 'package:ordrestyring_common/ordrestyring_common.dart';

extension CaseListEx on List<Case> {
  void get sortByStartDate {
    sort((a, b) {
      final startDateA = a.editorCalendar?.startDate;
      final startDateB = b.editorCalendar?.startDate;
      if (startDateA == null && startDateB == null) return 0;
      if (startDateA == null) return 1;
      if (startDateB == null) return -1;
      return startDateA.compareTo(startDateB);
    });
  }

  void get sortByEndDate {
    sort((a, b) {
      final endDateA = a.editorCalendar?.endDate;
      final endDateB = b.editorCalendar?.endDate;
      if (endDateA == null && endDateB == null) return 0;
      if (endDateA == null) return 1;
      if (endDateB == null) return -1;
      // return endDateA.compareTo(endDateB);
      return endDateB.compareTo(endDateA);
    });
  }

  void get sortByLengthOfProject {
    sort((a, b) {
      final lengthA = a.editorCalendar?.endDate
              .difference(
                a.editorCalendar?.startDate ?? TimeZoneHelper.nowInCopenhagen(),
              )
              .inDays ??
          0;
      final lengthB = b.editorCalendar?.endDate
              .difference(
                b.editorCalendar?.startDate ?? TimeZoneHelper.nowInCopenhagen(),
              )
              .inDays ??
          0;
      // return lengthA.compareTo(lengthB); // Shortest project first
      return lengthB.compareTo(lengthA); // Longest project first
    });
  }
}
