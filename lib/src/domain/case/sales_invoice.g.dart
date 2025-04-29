// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_invoice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SalesInvoiceImpl _$$SalesInvoiceImplFromJson(Map<String, dynamic> json) =>
    _$SalesInvoiceImpl(
      id: (json['id'] as num).toInt(),
      amount: (json['amount'] as num).toInt(),
      totalAmount: (json['totalAmount'] as num).toInt(),
      isPaid: json['isPaid'] as bool,
      date: const IntToTimestampConverter()
          .fromJson((json['date'] as num).toInt()),
    );

Map<String, dynamic> _$$SalesInvoiceImplToJson(_$SalesInvoiceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'totalAmount': instance.totalAmount,
      'isPaid': instance.isPaid,
      'date': const IntToTimestampConverter().toJson(instance.date),
    };
