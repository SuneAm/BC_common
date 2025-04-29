import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ordrestyring_common/src/utils/serializers/int_timestamp_converter.dart';
import 'package:timezone/timezone.dart' as tz;

part 'sales_invoice.freezed.dart';

part 'sales_invoice.g.dart';

@freezed
abstract class SalesInvoice implements _$SalesInvoice {
  const SalesInvoice._();

  const factory SalesInvoice({
    required int id,
    required int amount,
    required int totalAmount,
    required bool isPaid,
    @IntToTimestampConverter() required tz.TZDateTime date,
  }) = _SalesInvoice;

  factory SalesInvoice.fromJson(Map<String, dynamic> json) =>
      _$SalesInvoiceFromJson(json);
}
