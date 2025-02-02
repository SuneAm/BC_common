import 'package:flutter/material.dart';

class ScrollWithBar extends StatelessWidget {
  const ScrollWithBar({
    required this.controller,
    required this.child,
    this.scrollColor = const Color.fromARGB(255, 150, 198, 245),
    super.key,
  });

  final ScrollController controller;
  final Color scrollColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: WidgetStateProperty.all(
            scrollColor,
          ),
        ),
      ),
      child: Scrollbar(
        controller: controller,
        thumbVisibility: true,
        child: child,
      ),
    );
  }
}
