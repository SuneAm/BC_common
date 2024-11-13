import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ordrestyring_common/src/domain/case/case.dart';

import '../repositories/case_repostiory.dart';

class CasesStateNotifier extends StateNotifier<List<Case>> {
  CasesStateNotifier(super.state) {
    _cases = state;
  }

  late final List<Case> _cases;

  void filterCases(List<String> leaders) {
    state = _cases
        .where((e) => leaders.contains(e.responsibleUser.fullName))
        .toList();
  }
}

final caseLeaderNamesProvider = Provider.autoDispose<Set<String>>((ref) {
  final cases = ref.watch(watchCasesProvider);

  return cases.asData?.value.map((e) => e.responsibleUser.fullName).toSet() ??
      {};
});
