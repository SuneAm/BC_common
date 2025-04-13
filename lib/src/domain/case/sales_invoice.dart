import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_invoice.freezed.dart';
part 'sales_invoice.g.dart';

@freezed
class SalesInvoice with _$SalesInvoice {
  const factory SalesInvoice({
    required int id,
    required int amount,
    required int totalAmount,
    required bool isPaid,
  }) = _SalesInvoice;

  factory SalesInvoice.fromJson(Map<String, dynamic> json) =>
      _$SalesInvoiceFromJson(json);
}
