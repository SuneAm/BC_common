import 'package:intl/intl.dart';

extension NumberEx on num {
  String get toCurrency {
    // Convert the amount from øre to kroner
    double amountInKroner = this / 100;
    final format = NumberFormat.currency(
      locale: 'da-DK',
      symbol: 'kr.',
      customPattern: '#,##0.00 ¤',
    );

    final formattedAmount = format.format(amountInKroner);
    return formattedAmount;
  }
}
