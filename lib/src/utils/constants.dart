import 'package:flutter/material.dart';

/// Layout breakpoints used in the app.
class Breakpoint {
  static const double desktop = 900;
  static const double tablet = 600;
}

class Constant {
  static const double minBorderRadius = 6.0;
  static const double maxBorderRadius = 8.0;

  static BoxShadow appBoxShadow = const BoxShadow(
    color: Colors.black12,
    offset: Offset(0, 1),
    blurRadius: 2,
  );

  static BorderRadius setBorderRadius(double radius) =>
      BorderRadius.circular(radius);

  static BorderRadius setTopBorderRadius(double? radius) => BorderRadius.only(
        topLeft: Radius.circular(radius ?? maxBorderRadius),
        topRight: Radius.circular(radius ?? maxBorderRadius),
      );

  static BorderRadius setBottomBorderRadius(double? radius) =>
      BorderRadius.only(
        bottomLeft: Radius.circular(radius ?? maxBorderRadius),
        bottomRight: Radius.circular(radius ?? maxBorderRadius),
      );

  static const BorderRadius kNoBorderRadius = BorderRadius.zero;
  static const BorderRadius kBorderRadius =
      BorderRadius.all(Radius.circular(maxBorderRadius));
  static const BorderRadius kTopBorderRadius = BorderRadius.only(
    topLeft: Radius.circular(maxBorderRadius),
    topRight: Radius.circular(maxBorderRadius),
  );
  static const BorderRadius kBottomBorderRadius = BorderRadius.only(
    bottomLeft: Radius.circular(maxBorderRadius),
    bottomRight: Radius.circular(maxBorderRadius),
  );
  static const BorderRadius kLeftBorderRadius = BorderRadius.only(
    topLeft: Radius.circular(maxBorderRadius),
    bottomLeft: Radius.circular(maxBorderRadius),
  );

  static const BorderRadius kRightBorderRadius = BorderRadius.only(
    topRight: Radius.circular(maxBorderRadius),
    bottomRight: Radius.circular(maxBorderRadius),
  );
}
