part of 'produktion_calendar_view.dart';

class _ProduktionCalendarNavigationRow extends ConsumerWidget {
  const _ProduktionCalendarNavigationRow();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final zoomLevel = ref.watch(_produktionZoomLevelProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppIconContainer(
            backgroundColor: Colors.transparent,
            iconSize: 20,
            icon: Icons.arrow_back_ios_new,
            onTap: () {
              final currentStartRange = ref.read(_startRange);

              final newRange =
                  currentStartRange.subtract(const Duration(days: 7));

              ref.read(_startRange.notifier).state = newRange;
            },
          ),
          AppIconContainer(
            icon: Icons.remove,
            onTap: () => ref.read(_produktionZoomLevelProvider.notifier).state =
                zoomLevel.previous,
          ),
          TitleText('${zoomLevel.index + 1}'),
          AppIconContainer(
            icon: Icons.add,
            onTap: () => ref.read(_produktionZoomLevelProvider.notifier).state =
                zoomLevel.next,
          ),
          AppIconContainer(
            backgroundColor: Colors.transparent,
            iconSize: 20,
            icon: Icons.arrow_forward_ios,
            onTap: () {
              final currentStartRange = ref.read(_startRange);

              final newRange = currentStartRange.add(const Duration(days: 7));

              ref.read(_startRange.notifier).state = newRange;
            },
          ),
        ],
      ),
    );
  }
}
