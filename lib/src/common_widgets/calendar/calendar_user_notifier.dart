part of 'calendar_view.dart';

final productionEmployeesProvider =
    StateNotifierProvider.autoDispose<SelectedEmployeesNotifier, List<User>>(
        (ref) {
  return SelectedEmployeesNotifier();
});

final montageEmployeesProvider =
    StateNotifierProvider.autoDispose<SelectedEmployeesNotifier, List<User>>(
        (ref) {
  return SelectedEmployeesNotifier();
});

class SelectedEmployeesNotifier extends StateNotifier<List<User>> {
  SelectedEmployeesNotifier() : super([]);

  void initialize(List<User> users) {
    state = [...users];
  }

  void add(User employee) {
    if (!state.contains(employee)) {
      state = [...state, employee];
    }
  }

  void remove(User user) {
    state = state.where((e) => e.id != user.id).toList();
  }

  void addAll(List<User> employees) {
    state = [...employees];
  }
}
