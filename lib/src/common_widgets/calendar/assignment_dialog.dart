part of 'calendar_view.dart';

class AssignmentDialog extends HookConsumerWidget {
  const AssignmentDialog({super.key, this.assignment});

  final Assignment? assignment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController =
        useTextEditingController(text: assignment?.name ?? '');
    final selectedAssignmentColor = useState<DateCalendarColor>(
        assignment?.calendar.color ?? DateCalendarColor.blue);

    final dateRangeState = useState<DateTimeRange?>(
      assignment?.calendar == null
          ? null
          : DateTimeRange(
              start: assignment!.calendar.startDate,
              end: assignment!.calendar.endDate,
            ),
    );

    final type =
        useState<AssignmentType>(assignment?.type ?? AssignmentType.assignment);

    final isAssignment = type.value.isAssignment;
    return AppDialog(
      maxWidth: 500,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          spacing: 16,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: TitleText(
                    assignment == null
                        ? 'Tilføj opgave eller milestone'
                        : 'Opdateringsopgave',
                    textAlign: TextAlign.center,
                  ),
                ),
                IconContainer(
                    icon: isAssignment ? Icons.hexagon_outlined : Icons.hexagon,
                    onTap: () {
                      type.value = isAssignment
                          ? AssignmentType.milestone
                          : AssignmentType.assignment;
                      dateRangeState.value = assignment?.calendar == null
                          ? null
                          : DateTimeRange(
                              start: assignment!.calendar.startDate,
                              end: assignment!.calendar.endDate);
                    }),
              ],
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Opgavens navn',
                labelText: 'Navn',
              ),
            ),
            if (isAssignment)
              DateSelectionContainer(
                title: 'Projekt',
                backgroundColor: selectedAssignmentColor.value.toColor,
                onDateClear: () => dateRangeState.value == null,
                formatDate: dateRangeState.value?.formattedDates,
                onDateSelect: () async {
                  final selectedDate = await context.selectDateRange(
                    'Projekt Datoer',
                    initialDateRange: dateRangeState.value,
                  );
                  if (selectedDate != null) dateRangeState.value = selectedDate;
                },
              )
            else
              DateSelectionContainer(
                title: 'Milestone',
                backgroundColor: selectedAssignmentColor.value.toColor,
                onDateClear: () => dateRangeState.value == null,
                formatDate: dateRangeState.value?.start.formatDate,
                onDateSelect: () async {
                  final selectedDate = await context.selectDate(
                    'Milestone Dato',
                    initialDate: dateRangeState.value?.start,
                  );
                  if (selectedDate != null) {
                    dateRangeState.value = DateTimeRange(
                      start: selectedDate,
                      end: selectedDate,
                    );
                  }
                },
              ),
            Row(
              spacing: 12,
              children: [
                Expanded(
                  child: ColorRow(
                    value: selectedAssignmentColor.value,
                    onSelect: (color) => selectedAssignmentColor.value = color,
                  ),
                ),
                ElevatedButton(
                  child: const Text('Gem'),
                  onPressed: () async {
                    final name = nameController.text.trim();
                    final color = selectedAssignmentColor.value;
                    final dateRange = dateRangeState.value;

                    if (name.isEmpty) {
                      context.showSnackBar('Assignment Name Is Required');
                      return;
                    }
                    if (dateRange == null) {
                      context.showSnackBar(
                        isAssignment ? 'Vælg Start og Slut Dato' : 'Vælg Dato',
                      );
                      return;
                    }

                    final newAssignment = Assignment(
                      id: assignment?.id ?? '',
                      createdAt: assignment?.createdAt ?? DateTime.now(),
                      name: name,
                      type: type.value,
                      calendar: DateCalendar(
                        color: color,
                        startDate: dateRange.start,
                        endDate: type.value.isMilestone
                            ? dateRange.start
                            : dateRange.end,
                      ),
                    );

                    final repo = ref.read(assignmentRepoProvider);

                    assignment == null
                        ? await repo.addNew(newAssignment)
                        : await repo.update(newAssignment);
                    if (context.mounted) Navigator.pop(context);
                  },
                ),
                if (assignment != null)
                  IconContainer(
                    onTap: () {
                      ref.read(assignmentRepoProvider).delete(assignment!.id);
                      if (context.mounted) Navigator.pop(context);
                    },
                    icon: Icons.delete_forever,
                    color: Colors.red,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
