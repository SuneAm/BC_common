part of 'calendar_view.dart';

class CalendarMenuDialog extends HookConsumerWidget {
  const CalendarMenuDialog({
    super.key,
    required this.caseItem,
    required this.dialogTopBar,
  });

  final Case caseItem;
  final Widget dialogTopBar;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedEditorColor = useState<AssignmentColor>(
        caseItem.editorCalendar?.peopleColor ?? AssignmentColor.blue);
    final editorDateRange = useState<DateTimeRange?>(
      caseItem.editorCalendar == null
          ? null
          : DateTimeRange(
              start: caseItem.editorCalendar!.startDate,
              end: caseItem.editorCalendar!.endDate,
            ),
    );

    final productionDateRange = useState<DateTimeRange?>(
      caseItem.productionCalendar == null
          ? null
          : DateTimeRange(
              start: caseItem.productionCalendar!.startDate,
              end: caseItem.productionCalendar!.endDate,
            ),
    );

    final montageDateRange = useState<DateTimeRange?>(
      caseItem.montageCalendar == null
          ? null
          : DateTimeRange(
              start: caseItem.montageCalendar!.startDate,
              end: caseItem.montageCalendar!.endDate,
            ),
    );

    final canSetDate = editorDateRange.value != null;

    final productionUsers = ref.watch(productionEmployeesProvider);
    final montageUsers = ref.watch(montageEmployeesProvider);

    useEffect(() {
      Future(() {
        ref
            .read(productionEmployeesProvider.notifier)
            .initialize(caseItem.productionUsers ?? []);
        ref
            .read(montageEmployeesProvider.notifier)
            .initialize(caseItem.montageUsers ?? []);
      });
      return null;
    }, []);
    return AppDialog(
      maxWidth: 500,
      maxHeight: 800,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          dialogTopBar,
          const SizedBox(height: 8),
          DateSelectionContainer(
            users: const [],
            title: 'Projekt',
            backgroundColor: selectedEditorColor.value.toColor,
            formatDate: editorDateRange.value?.formattedDates,
            onDateClear: () {
              editorDateRange.value = null;
              productionDateRange.value = null;
              montageDateRange.value = null;
            },
            onDateSelect: () async {
              final selectedDate = await context.selectDateRange(
                'Projekt Dates',
                initialDateRange: editorDateRange.value,
              );
              if (selectedDate != null) {
                editorDateRange.value = selectedDate;
                productionDateRange.value = null;
                montageDateRange.value = null;
              }
            },
          ),
          DateSelectionContainer(
            title: 'Production',
            backgroundColor: OrdrerColors.kProduktionAppColor,
            formatDate: productionDateRange.value?.formattedDates,
            onDateClear: () => productionDateRange.value = null,
            onDateSelect: !canSetDate
                ? null
                : () async {
                    final selectedDate = await context.selectDateRange(
                      'Production Dates',
                      initialDateRange: productionDateRange.value,
                      firstDate: editorDateRange.value!.start,
                      lastDate: editorDateRange.value!.end,
                    );
                    if (selectedDate != null) {
                      productionDateRange.value = selectedDate;
                    }
                  },
            users: productionUsers,
            onPeopleSelect: () => context.openDialog(
              _UserListDialog(
                isProduction: true,
                onValueChange: (newValue, user) {
                  final notifier =
                      ref.read(productionEmployeesProvider.notifier);

                  newValue == true ? notifier.add(user) : notifier.remove(user);
                },
              ),
            ),
          ),
          DateSelectionContainer(
            title: 'Montage',
            backgroundColor: OrdrerColors.kMontageAppColor,
            formatDate: montageDateRange.value?.formattedDates,
            onDateClear: () => montageDateRange.value = null,
            onDateSelect: !canSetDate
                ? null
                : () async {
                    final selectedDate = await context.selectDateRange(
                      'Montage Dates',
                      firstDate: editorDateRange.value!.start,
                      lastDate: editorDateRange.value!.end,
                      initialDateRange: montageDateRange.value,
                    );

                    if (selectedDate != null) {
                      montageDateRange.value = selectedDate;
                    }
                  },
            users: montageUsers,
            onPeopleSelect: () {
              context.openDialog(
                _UserListDialog(
                  isProduction: false,
                  onValueChange: (newValue, user) {
                    final notifier =
                        ref.read(montageEmployeesProvider.notifier);

                    newValue == true
                        ? notifier.add(user)
                        : notifier.remove(user);
                  },
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: ColorRow(
                    value: selectedEditorColor.value,
                    onSelect: (color) => selectedEditorColor.value = color,
                  ),
                ),
                ElevatedButton(
                  child: const Text('Gem og luk'),
                  onPressed: () async {
                    if (editorDateRange.value == null) return;

                    final editorCalendar = CaseCalendar(
                      startDate: editorDateRange.value!.start,
                      endDate: editorDateRange.value!.end,
                      peopleColor: selectedEditorColor.value,
                    );

                    final productionCalendar = productionDateRange.value == null
                        ? null
                        : CaseCalendar(
                            startDate: productionDateRange.value!.start,
                            endDate: productionDateRange.value!.end,
                          );

                    final montageCalendar = (montageDateRange.value == null)
                        ? null
                        : CaseCalendar(
                            startDate: montageDateRange.value!.start,
                            endDate: montageDateRange.value!.end,
                          );

                    final updatedCase = caseItem.copyWith(
                      editorCalendar: editorCalendar,
                      productionCalendar: productionCalendar,
                      montageCalendar: montageCalendar,
                      productionUsers: productionUsers,
                      montageUsers: montageUsers,
                      isProduktion: productionCalendar != null,
                      isMontage: montageCalendar != null,
                    );
                    await ref.read(caseRepoProvider).updateCase(
                          updatedCase,
                          merge: false,
                        );

                    if (context.mounted) Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _UserListDialog extends ConsumerWidget {
  const _UserListDialog({
    required this.onValueChange,
    required this.isProduction,
  });

  final Function(bool newValue, User user) onValueChange;
  final bool isProduction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(usersProvider);
    final selectedUsers = isProduction
        ? ref.watch(productionEmployeesProvider)
        : ref.watch(montageEmployeesProvider);

    return Dialog(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 400,
          maxHeight: 600,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: TitleLarge(
                      'Medarbejdere',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Submit'),
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (BuildContext context, int index) {
                    final u = users[index];
                    final isSelected = selectedUsers.any((e) => e.id == u.id);

                    return CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      value: isSelected,
                      title: Text(u.fullName),
                      onChanged: (newValue) => onValueChange.call(newValue!, u),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
