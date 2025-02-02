import 'package:flutter/material.dart';
import 'package:ordrestyring_common/src/styles/ordrer_colors.dart';
import 'package:ordrestyring_common/src/utils/enum_extensions.dart';

class ColorRow extends StatelessWidget {
  const ColorRow({super.key, required this.value, required this.onSelect});

  final CalendarColor value;
  final Function(CalendarColor color) onSelect;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 2,
      children: CalendarColor.values
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
