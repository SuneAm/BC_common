import 'package:flutter/foundation.dart';

import 'case_estimated_hour.dart';
import 'case_type.dart';
import 'economy.dart';
import 'hour_aggregate.dart';
import 'responsible_user.dart';
import 'status.dart';

@immutable
class Case {
  const Case({
    required this.id,
    required this.caseNumber,
    required this.projectName,
    required this.economy,
    required this.responsibleUser,
    required this.caseType,
    required this.status,
    this.hourAggregate,
    this.estimatedExpanse,
    this.estimatedHours,
  });

  final int id;
  final double? estimatedExpanse;
  final String caseNumber;
  final String projectName;
  final Economy economy;
  final ResponsibleUser responsibleUser;
  final CaseType caseType;
  final Status status;
  final HourAggregate? hourAggregate;

  final CaseEstimatedHour? estimatedHours;

  Map<String, dynamic> toFirestore() {
    return {
      // if (estimatedTimer != null) 'estimatedTimer': estimatedTimer,
      'id': id,
      'caseNumber': caseNumber,
      'projectName': projectName,
      'economy': economy.toFirestore(),
      'responsibleUser': responsibleUser.toFirestore(),
      'caseType': caseType.toFirestore(),
      'status': status.toFirestore(),
      if (hourAggregate != null) 'hourAggregate': hourAggregate!.toFirestore(),
      if (estimatedExpanse != null) 'estimatedExpanse': estimatedExpanse,
      if (estimatedHours != null) 'estimatedHours': estimatedHours!.toJson(),
    };
  }

  factory Case.fromJson(Map<String, dynamic> json) {
    return Case(
      id: json['id'],
      caseNumber: json['caseNumber'] ?? '',
      projectName: json['projectName'] ?? '',
      economy: Economy.fromJson(json['economy'] ?? {}),
      responsibleUser: ResponsibleUser.fromJson(json['responsibleUser'] ?? {}),
      caseType: CaseType.fromJson(json['caseType'] ?? {}),
      status: Status.fromJson(json['status'] ?? {}),
    );
  }

  factory Case.fromFirestore(Map<String, dynamic> json) {
    final estimatedHour = json['estimatedHours'];

    return Case(
      id: json['id'],
      estimatedExpanse: json['estimatedExpanse'],
      caseNumber: json['caseNumber'] ?? '',
      projectName: json['projectName'] ?? '',
      economy: Economy.fromJson(json['economy'] ?? {}),
      responsibleUser: ResponsibleUser.fromJson(
        json['responsibleUser'] ?? {},
      ),
      caseType: CaseType.fromJson(json['caseType'] ?? {}),
      status: Status.fromJson(json['status'] ?? {}),
      hourAggregate: HourAggregate.fromMap(json['hourAggregate']),
      estimatedHours: estimatedHour == null
          ? null
          : CaseEstimatedHour.fromJson(estimatedHour),
    );
  }

  Case copyWith({
    String? caseNumber,
    String? projectName,
    Economy? economy,
    ResponsibleUser? responsibleUser,
    CaseType? caseType,
    Status? status,
    int? estimatedTimer,
    int? id,
    HourAggregate? hourAggregate,
    double? estimatedExpanse,
    CaseEstimatedHour? caseEstimatedHours,
  }) {
    return Case(
      id: id ?? this.id,
      caseNumber: caseNumber ?? this.caseNumber,
      projectName: projectName ?? this.projectName,
      economy: economy ?? this.economy,
      responsibleUser: responsibleUser ?? this.responsibleUser,
      caseType: caseType ?? this.caseType,
      status: status ?? this.status,
      hourAggregate: hourAggregate ?? this.hourAggregate,
      estimatedExpanse: estimatedExpanse ?? this.estimatedExpanse,
      estimatedHours: caseEstimatedHours ?? estimatedHours,
    );
  }
}
