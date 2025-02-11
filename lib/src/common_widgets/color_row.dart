import 'package:flutter/material.dart';
import 'package:ordrestyring_common/src/domain/date_calendar.dart';

class ColorRow extends StatelessWidget {
  const ColorRow({super.key, required this.value, required this.onSelect});

  final DateCalendarColor value;
  final Function(DateCalendarColor color) onSelect;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 2,
      children: DateCalendarColor.values
          .map(
            (color) => InkWell(
              onTap: () => onSelect.call(color),
              child: Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  color: color.toColor,
                  border: color == value ? Border.all(width: 2) : null,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
