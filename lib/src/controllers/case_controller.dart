import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ordrestyring_common/src/domain/case/case.dart';

import '../repositories/case_repostiory.dart';

class CasesStateNotifier extends StateNotifier<List<Case>> {
  CasesStateNotifier(super.state) {
    _cases = state;
    filterCasesByStatus(true); // Default to open cases
  }

  late final List<Case> _cases;

  void filterCases(List<String> leaders) {
    state = _cases
        .where((e) => leaders.contains(e.responsibleUser.fullName))
        .toList();
  }

  void filterCasesByStatus(bool isOpen) {
    state = _cases
        .where(
            (e) => isOpen ? e.status.text == 'Åben' : e.status.text == 'Lukket')
        .toList();
  }
}

final caseLeaderNamesProvider = Provider.autoDispose<Set<String>>((ref) {
  final cases = ref.watch(casesProvider);

  return cases.map((e) => e.responsibleUser.fullName).toSet();
});
