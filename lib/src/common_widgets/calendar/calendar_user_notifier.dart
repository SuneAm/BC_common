part of 'calendar_view.dart';

final productionEmployeesProvider = StateNotifierProvider.autoDispose<
    SelectedEmployeesNotifier, List<UserInfo>>((ref) {
  return SelectedEmployeesNotifier();
});

final montageEmployeesProvider = StateNotifierProvider.autoDispose<
    SelectedEmployeesNotifier, List<UserInfo>>((ref) {
  return SelectedEmployeesNotifier();
});

class SelectedEmployeesNotifier extends StateNotifier<List<UserInfo>> {
  SelectedEmployeesNotifier() : super([]);

  void initialize(List<UserInfo> users) {
    state = [...users];
  }

  void add(UserInfo employee) {
    if (!state.contains(employee)) {
      state = [...state, employee];
    }
  }

  void remove(UserInfo user) {
    state = state.where((e) => e.id != user.id).toList();
  }

  void addAll(List<UserInfo> employees) {
    state = [...employees];
  }
}
