import 'package:flutter/material.dart';

import 'app_container.dart';

class IconContainer extends StatelessWidget {
  const IconContainer({
    required this.icon,
    this.onTap,
    this.size = 24,
    this.color,
    this.backgroundColor = Colors.transparent,
    this.padding = const EdgeInsets.all(4.0),
    super.key,
  });

  final EdgeInsets padding;
  final IconData icon;
  final VoidCallback? onTap;
  final double size;
  final Color? color;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      onTap: onTap,
      borderRadius: BorderRadius.circular(size),
      padding: padding,
      color: backgroundColor,
      child: Icon(
        icon,
        size: size,
        color: color,
      ),
    );
  }
}
