import 'package:flutter/material.dart';
import 'package:ordrestyring_common/ordrestyring_common.dart';

class AppIconContainer extends StatelessWidget {
  const AppIconContainer({
    super.key,
    this.backgroundColor,
    this.iconSize,
    required this.icon,
    required this.onTap,
  });

  final VoidCallback onTap;
  final Color? backgroundColor;
  final IconData icon;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      color: backgroundColor ?? Theme.of(context).colorScheme.surfaceContainer,
      onTap: onTap,
      boxShape: BoxShape.circle,
      padding: EdgeInsets.zero,
      betweenTilePadding: const EdgeInsets.symmetric(horizontal: 8),
      borderRadius: const BorderRadius.all(
        Radius.circular(16.0),
      ),
      child: Icon(icon, size: iconSize),
    );
  }
}
