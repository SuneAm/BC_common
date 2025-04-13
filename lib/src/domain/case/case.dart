import 'package:flutter/foundation.dart';
import 'package:ordrestyring_common/ordrestyring_common.dart';
import 'package:ordrestyring_common/src/domain/case/delivery_address.dart';
import 'package:ordrestyring_common/src/domain/case/sales_invoice.dart';

import 'case_type.dart';
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
    required this.salesInvoices,
    this.contactPersons,
    this.hourAggregate,
    this.estimatedExpanse,
    this.estimatedHours,
    this.deliveryAddress,
    this.comments,
    this.isProduktion,
    this.isMontage,
    this.useInCalendar,
    this.editorCalendar,
    this.productionCalendar,
    this.montageCalendar,
    this.productionUsers,
    this.montageUsers,
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
  final List<ContactPerson>? contactPersons;
  final List<SalesInvoice> salesInvoices;

  final String? comments;

  final bool? isProduktion;
  final bool? isMontage;
  final bool? useInCalendar;

  final DateCalendar? editorCalendar;
  final DateCalendar? productionCalendar;
  final DateCalendar? montageCalendar;
  final List<UserInfo>? productionUsers;
  final List<UserInfo>? montageUsers;

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
      if (contactPersons != null)
        'contactPersons': contactPersons!.map((e) => e.toJson()).toList(),
      // 'salesInvoices': salesInvoices.map((e) => e.toJson()).toList(),
      'salesInvoices':
          salesInvoices.where((e) => e.isPaid).map((m) => m.toJson()).toList(),
      if (isMontage != null) 'isMontage': isMontage,
      if (isProduktion != null) 'isProduktion': isProduktion,
      if (useInCalendar != null) 'useInCalendar': useInCalendar,
      if (comments != null) 'comments': comments,
      if (editorCalendar != null) 'editorCalendar': editorCalendar?.toJson(),
      if (productionCalendar != null)
        'productionCalendar': productionCalendar?.toJson(),
      if (montageCalendar != null) 'montageCalendar': montageCalendar?.toJson(),
      if (productionUsers != null)
        'productionUsers': productionUsers!.map((u) => u.toJson()),
      if (montageUsers != null)
        'montageUsers': montageUsers!.map((u) => u.toJson()),
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
      salesInvoices: (json['salesInvoices'] as List<dynamic>?)
              ?.map((e) => SalesInvoice.fromJson(e))
              .toList() ??
          [],
    );
  }

  factory Case.fromFirestore(Map<String, dynamic> json) {
    final estimatedHour = json['estimatedHours'];
    final deliveryAddress = json['deliveryAddress'];
    final contactPersons = json['contactPersons'] as List?;

    final editorCalendar = json['editorCalendar'];
    final productionCalendar = json['productionCalendar'];
    final montageCalendar = json['montageCalendar'];
    final productionUsers = json['productionUsers'] as List?;
    final montageUsers = json['montageUsers'] as List?;

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
      contactPersons:
          contactPersons?.map((e) => ContactPerson.fromJson(e)).toList(),
      salesInvoices: (json['salesInvoices'] as List<dynamic>?)
              ?.map((e) => SalesInvoice.fromJson(e))
              .toList() ??
          [],
      isProduktion: json['isProduktion'] ?? false,
      isMontage: json['isMontage'] ?? false,
      useInCalendar: json['useInCalendar'] ?? false,
      comments: json['comments'],
      editorCalendar:
          editorCalendar == null ? null : DateCalendar.fromJson(editorCalendar),
      productionCalendar: productionCalendar == null
          ? null
          : DateCalendar.fromJson(productionCalendar),
      montageCalendar: montageCalendar == null
          ? null
          : DateCalendar.fromJson(montageCalendar),
      productionUsers:
          productionUsers?.map((u) => UserInfo.fromJson(u)).toList(),
      montageUsers: montageUsers?.map((u) => UserInfo.fromJson(u)).toList(),
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
    bool? useInCalendar,
    List<ContactPerson>? contactPersons,
    List<SalesInvoice>? salesInvoices,
    String? comments,
    DateCalendar? editorCalendar,
    DateCalendar? productionCalendar,
    DateCalendar? montageCalendar,
    List<UserInfo>? productionUsers,
    List<UserInfo>? montageUsers,
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
      contactPersons: contactPersons ?? this.contactPersons,
      salesInvoices: salesInvoices ?? this.salesInvoices,
      isMontage: isMontage ?? this.isMontage,
      isProduktion: isProduktion ?? this.isProduktion,
      useInCalendar: useInCalendar ?? this.useInCalendar,
      comments: comments ?? this.comments,
      editorCalendar: editorCalendar,
      productionCalendar: productionCalendar,
      montageCalendar: montageCalendar,
      productionUsers: productionUsers,
      montageUsers: montageUsers,
    );
  }
}
