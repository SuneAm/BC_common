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
    final progressState =
        useRef<double>(caseItem.editorCalendar?.progress ?? 0.0);
    final selectedEditorColor = useState<CalendarColor>(
        caseItem.editorCalendar?.calendarColor ?? CalendarColor.blue);
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
          _ProgressSlider(
            color: selectedEditorColor.value.toColor,
            value: progressState.value,
            onChanged: (v) => progressState.value = v,
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
                    late final Case updatedCase;
                    late final CaseCalendar? editorCalendar;
                    late final CaseCalendar? productionCalendar;
                    late final CaseCalendar? montageCalendar;
                    if (editorDateRange.value == null) {
                      // clears the calendar dates
                      editorCalendar = null;
                      productionCalendar = null;
                      montageCalendar = null;
                    } else {
                      editorCalendar = CaseCalendar(
                        startDate: editorDateRange.value!.start,
                        endDate: editorDateRange.value!.end,
                        calendarColor: selectedEditorColor.value,
                        progress: double.parse(
                          progressState.value
                              .clamp(0.0, 1.0)
                              .toStringAsFixed(2),
                        ),
                      );
                      productionCalendar = productionDateRange.value == null
                          ? null
                          : CaseCalendar(
                              startDate: productionDateRange.value!.start,
                              endDate: productionDateRange.value!.end,
                            );

                      montageCalendar = (montageDateRange.value == null)
                          ? null
                          : CaseCalendar(
                              startDate: montageDateRange.value!.start,
                              endDate: montageDateRange.value!.end,
                            );
                    }

                    updatedCase = caseItem.copyWith(
                      editorCalendar: editorCalendar,
                      productionCalendar: productionCalendar,
                      montageCalendar: montageCalendar,
                      productionUsers:
                          productionCalendar == null ? null : productionUsers,
                      montageUsers:
                          montageCalendar == null ? null : montageUsers,
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

class _ProgressSlider extends HookConsumerWidget {
  const _ProgressSlider({
    required this.color,
    required this.value,
    required this.onChanged,
  });

  final double value;
  final Color color;
  final void Function(double) onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = useState<double>(value);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Slider(
              inactiveColor: OrdrerColors.kProduktionAppColor,
              activeColor: color,
              value: progress.value,
              onChangeEnd: onChanged,
              onChanged: (v) => progress.value = v,
            ),
          ),
          Text('${(progress.value * 100).round()}%')
        ],
      ),
    );
  }
}
