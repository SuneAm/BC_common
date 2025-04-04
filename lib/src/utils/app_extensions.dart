import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ordrestyring_common/src/utils/constants.dart';

extension NumberEx on num {
  String get toCurrency {
    // Convert the amount from øre to kroner
    double amountInKroner = this / 100;

    return _formatToCurrency(amountInKroner);
  }

  String get toSimpleCurrency => _formatToCurrency(this);

  String _formatToCurrency(num number) {
    final format = NumberFormat.currency(
      locale: 'da-DK',
      symbol: 'kr.',
      customPattern: '#,##0.00 ¤',
    );

    final formattedAmount = format.format(number);
    return formattedAmount;
  }

  bool get hasFraction => ((this % 1) != 0);

  String get asString => toStringAsFixed(hasFraction ? 2 : 0);
}

extension BuildContextEx on BuildContext {
  Size get _size => MediaQuery.of(this).size;

  double get width => _size.width;

  bool get isMobile => width < Breakpoint.tablet;

  bool get isTablet => width < Breakpoint.desktop && width >= Breakpoint.tablet;

  bool get isDesktop => width >= Breakpoint.desktop;

  Future openDialog(Widget child) => showDialog(
        context: this,
        builder: (_) => child,
      );

  void showSnackBar(String message, {SnackBar? snackBar}) =>
      ScaffoldMessenger.of(this)
        ..removeCurrentSnackBar()
        ..showSnackBar(snackBar ?? SnackBar(content: Text(message)));
}
