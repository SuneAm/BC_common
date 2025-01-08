import 'package:flutter/material.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    required this.child,
    this.maxWidth = 450,
    this.maxHeight,
  });

  final double? maxHeight;
  final double maxWidth;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: SizedBox(
        width: maxWidth,
        height: maxHeight,
        child: child,
      ),
    );
  }
}
