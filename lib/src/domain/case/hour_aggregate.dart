import 'package:flutter/foundation.dart';

import 'hour_types.dart';

@immutable
class HourAggregate {
  const HourAggregate({required this.totalCostPrice, required this.totalHours, required this.hourTypes});

  final double totalCostPrice, totalHours;
  final List<HourTypes> hourTypes;

  @override
  String toString() {
    return 'HourAggregate{ totalCostPrice: $totalCostPrice, totalHours: $totalHours, hourTypes: $hourTypes}';
  }

  HourAggregate copyWith({
    double? totalCostPrice,
    double? totalHours,
    List<HourTypes>? hourTypes,
  }) {
    return HourAggregate(
      totalCostPrice: totalCostPrice ?? this.totalCostPrice,
      totalHours: totalHours ?? this.totalHours,
      hourTypes: hourTypes ?? this.hourTypes,
    );
  }

  Map<String, dynamic> toFirestore() {
    final types = hourTypes.map((item) => item.toFirestore()).toList();
    return {
      'totalCostPrice': totalCostPrice,
      'totalHours': totalHours,
      'hourTypes': types,
    };
  }

  factory HourAggregate.fromMap(Map<String, dynamic> map) {
    final hourTypes = map['hourTypes'].map<HourTypes>((item) => HourTypes.fromMap(item)).toList();
    return HourAggregate(
      totalCostPrice: map['totalCostPrice'] as double,
      totalHours: map['totalHours'] as double,
      hourTypes: hourTypes,
    );
  }
}
