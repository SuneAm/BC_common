part of 'calendar_view.dart';

class AssignmentDialog extends HookConsumerWidget {
  const AssignmentDialog({super.key, this.assignment});

  final Assignment? assignment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController =
        useTextEditingController(text: assignment?.name ?? '');
    final selectedAssignmentColor =
        useState<AssignmentColor>(assignment?.color ?? AssignmentColor.blue);

    final dateRangeState = useState<DateTimeRange?>(
      assignment?.calendar == null
          ? null
          : DateTimeRange(
              start: assignment!.calendar.startDate,
              end: assignment!.calendar.endDate),
    );
    return AppDialog(
      maxWidth: 500,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          spacing: 16,
          mainAxisSize: MainAxisSize.min,
          children: [
            TitleText(
                assignment == null ? 'tilføje opgave' : 'opdateringsopgave'),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'opgavens navn',
                labelText: 'navn',
              ),
            ),
            DateSelectionContainer(
              title: 'Projekt',
              backgroundColor: selectedAssignmentColor.value.toColor,
              onDateClear: () => dateRangeState.value == null,
              formatDate: dateRangeState.value?.formattedDates,
              onDateSelect: () async {
                final selectedDate = await context.selectDateRange(
                  'Projekt Dates',
                  initialDateRange: dateRangeState.value,
                );
                if (selectedDate != null) dateRangeState.value = selectedDate;
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
                      context.showSnackBar('Select Start and End Dates');
                      return;
                    }

                    final newAssignment = Assignment(
                      id: assignment?.id ?? '',
                      name: name,
                      color: color,
                      calendar: AssignmentCalendar(
                        startDate: dateRange.start,
                        endDate: dateRange.end,
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
