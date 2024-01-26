import 'package:flutter/foundation.dart';

@immutable
class CaseType {
  const CaseType({required this.text});

  final String text;

  Map<String, dynamic> toFirestore() => {'text': text};

  factory CaseType.fromJson(Map<String, dynamic> json) {
    return CaseType(text: json['text'] ?? 'Type');
  }
}
