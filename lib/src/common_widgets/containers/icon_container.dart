import 'package:flutter/material.dart';

import 'app_container.dart';

class IconContainer extends StatelessWidget {
  const IconContainer({
    required this.icon,
    this.onTap,
    this.size,
    this.color,
    super.key,
  });

  final IconData icon;
  final VoidCallback? onTap;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      onTap: onTap,
      boxShape: BoxShape.circle,
      padding: const EdgeInsets.all(4.0),
      child: Icon(
        icon,
        size: size,
        color: color,
      ),
    );
  }
}
