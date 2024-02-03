import 'package:flutter/foundation.dart';
import 'package:ordrestyring_common/src/domain/case/delivery_address.dart';

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
    this.deliveryAddress,
    this.isProduktion,
    this.isMontage,
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
  final DeliveryAddress? deliveryAddress;

  final bool? isProduktion;
  final bool? isMontage;

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
      if (deliveryAddress != null) 'deliveryAddress': deliveryAddress!.toJson(),
      if (isMontage != null) 'isMontage': isMontage,
      if (isProduktion != null) 'isProduktion': isProduktion,
    };
  }

  factory Case.fromJson(Map<String, dynamic> json) {
    final deliveryAddress = json['deliveryAddress'];
    return Case(
      id: json['id'],
      caseNumber: json['caseNumber'] ?? '',
      projectName: json['projectName'] ?? '',
      economy: Economy.fromJson(json['economy'] ?? {}),
      responsibleUser: ResponsibleUser.fromJson(json['responsibleUser'] ?? {}),
      caseType: CaseType.fromJson(json['caseType'] ?? {}),
      status: Status.fromJson(json['status'] ?? {}),
      deliveryAddress: deliveryAddress == null
          ? null
          : DeliveryAddress.fromJson(json['deliveryAddress'] ?? {}),
    );
  }

  factory Case.fromFirestore(Map<String, dynamic> json) {
    final estimatedHour = json['estimatedHours'];
    final deliveryAddress = json['deliveryAddress'];

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
      deliveryAddress: deliveryAddress == null
          ? null
          : DeliveryAddress.fromJson(deliveryAddress),
      isProduktion: json['isProduktion'] ?? false,
      isMontage: json['isMontage'] ?? false,
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
    DeliveryAddress? deliveryAddress,
    bool? isMontage,
    bool? isProduktion,
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
      deliveryAddress: deliveryAddress ?? this.deliveryAddress,
      isMontage: isMontage ?? this.isMontage,
      isProduktion: isProduktion ?? this.isProduktion,
    );
  }
}
