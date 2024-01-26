import 'package:flutter/foundation.dart';

@immutable
class Status {
  const Status({required this.text});

  final String text;

  Map<String, dynamic> toFirestore() => {'text': text};

  factory Status.fromJson(Map<String, dynamic> json) => Status(text: json['text'] ?? 'Status');
}
