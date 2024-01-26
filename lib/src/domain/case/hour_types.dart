import 'package:flutter/foundation.dart';

@immutable
class HourTypes {
  const HourTypes({required this.name, required this.totalCostPrice, required this.totalHours, this.totalWorkHours});

  final String name;
  final double totalCostPrice, totalHours;
  final double? totalWorkHours;

  @override
  String toString() {
    return 'HourTypes{ name: $name, totalCostPrice: $totalCostPrice, totalHours: $totalHours}';
  }

  HourTypes copyWith({
    String? name,
    double? totalCostPrice,
    double? totalHours,
    double? totalWorkHours,
  }) {
    return HourTypes(
      name: name ?? this.name,
      totalCostPrice: totalCostPrice ?? this.totalCostPrice,
      totalHours: totalHours ?? this.totalHours,
      totalWorkHours: totalWorkHours ?? this.totalWorkHours,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'totalCostPrice': totalCostPrice,
      'totalHours': totalHours,
      if (totalWorkHours != null) 'totalWorkHours': totalWorkHours,
    };
  }

  factory HourTypes.fromMap(Map<String, dynamic> map) {
    return HourTypes(
      name: map['name'] as String,
      totalCostPrice: map['totalCostPrice'] as double,
      totalHours: map['totalHours'] as double,
      totalWorkHours: map['totalWorkHours'] as double?,
    );
  }
}
