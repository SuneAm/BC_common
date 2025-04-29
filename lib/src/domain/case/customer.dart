import 'package:flutter/foundation.dart';

@immutable
class Customer {
  const Customer({required this.name});

  final String name;

  Customer copyWith({String? name}) => Customer(name: name ?? this.name);

  Map<String, dynamic> toMap() {
    return {'name': name};
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      name: map['name'] as String,
    );
  }
}
