import 'package:flutter/material.dart';
import 'package:ordrestyring_common/src/utils/constants.dart';

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget(
      {super.key, required this.mobile, this.desktop, this.tablet});

  final Widget? desktop;
  final Widget? tablet;
  final Widget mobile;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= Breakpoint.desktop) {
          // Desktop layout
          // This is for screens wider than 840dp, typically desktops or large tablets in landscape mode.
          return desktop ?? tablet ?? mobile;
        } else if (constraints.maxWidth >= Breakpoint.tablet) {
          // Tablet layout
          // This is for screens wider than 600dp but less than 840dp, covering tablets and large phones.
          return tablet ?? mobile;
        } else {
          // Mobile layout
          // This is for screens less than 600dp wide, typically phones in portrait or landscape mode.
          return mobile;
        }
      },
    );
  }
}
