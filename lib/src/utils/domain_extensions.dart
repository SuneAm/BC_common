import 'package:ordrestyring_common/ordrestyring_common.dart';
import 'package:ordrestyring_common/ordrestyring_common.dart' as tz
    show TZDateTime;

extension CaseCalendarEx on DateCalendar? {
  String get toFormattedDates => this == null
      ? ''
      : '${this!.startDate.formatDateShort} - ${this!.endDate.formatDateShort}';
}

extension AssignmentTypeEx on AssignmentType {
  bool get isAssignment => this == AssignmentType.assignment;

  bool get isMilestone => this == AssignmentType.milestone;
}

extension CaseEx on Case {
  double get materialCost =>
      economy.calculatedHoursSalesPrice - economy.hoursSalesprice;

  bool get isOpen => status.text == 'Åben';

  bool get isClosed => status.text == 'Lukket';
}

extension CaseEstimatedHourEx on CaseEstimatedHour? {
  double get estimatedProjectHour => this?.estimatedProjectHour ?? 0;

  double get estimatedProductionHour => this?.estimatedProductionHour ?? 0;

  double get estimatedMontageHour => this?.estimatedMontageHour ?? 0;

  double get estimatedMaterialPrice => this?.estimatedMaterialPrice ?? 0.0;

  double get totalEstimatedHour =>
      (estimatedProjectHour + estimatedProductionHour + estimatedMontageHour);

  double get _costProjectRate => 360;

  double get _salesProjectRate => 900;

  double get _costProduktionRate => 280;

  double get _salesProduktionRate => 640;

  double get _costMontageRate => 280;

  double get _salesMontageRate => 500;

  double get _costMaterialRate => 1;

  double get _salesMaterialRate => 1.6;

  double get getCostProjectRate =>
      this?.projectRate?.costPrice ?? _costProjectRate;

  double get getSalesProjectRate =>
      this?.projectRate?.salesPrice ?? _salesProjectRate;

  double get getCostProduktionRate =>
      this?.produktionRate?.costPrice ?? _costProduktionRate;

  double get getSalesProduktionRate =>
      this?.produktionRate?.salesPrice ?? _salesProduktionRate;

  double get getCostMontageRate =>
      this?.montageRate?.costPrice ?? _costMontageRate;

  double get getSalesMontageRate =>
      this?.montageRate?.salesPrice ?? _salesMontageRate;

  double get getCostMaterialRate =>
      this?.materialRate?.costPrice ?? _costMaterialRate;

  double get getSalesMaterialRate =>
      this?.materialRate?.salesPrice ?? _salesMaterialRate;

  double estimatedProjectPrice(bool isCostPrice) {
    final rate = isCostPrice ? getCostProjectRate : getSalesProjectRate;
    final hour = this?.estimatedProjectHour ?? 0.0;

    return hour * rate;
  }

  double estimatedProduktionPrice(bool costPrice) {
    final rate = costPrice ? getCostProduktionRate : getSalesProduktionRate;
    final hour = this?.estimatedProductionHour ?? 0.0;

    return hour * rate;
  }

  double estimatedMontagePrice(bool costPrice) {
    final rate = costPrice ? getCostMontageRate : getSalesMontageRate;
    final hour = this?.estimatedMontageHour ?? 0.0;

    return hour * rate;
  }

  double getEstimatedMaterialPrice(bool costPrice) {
    final rate = costPrice ? getCostMaterialRate : getSalesMaterialRate;
    final hour = this?.estimatedMaterialPrice ?? 0.0;

    return hour * rate;
  }

  double get estimatedMaterialPriceWithCostPrice {
    final isCostPrice = true;
    final projectCostPrice = estimatedProjectPrice(isCostPrice);
    final produktionCostPrice = estimatedProduktionPrice(isCostPrice);
    final montageCostPrice = estimatedMontagePrice(isCostPrice);

    final estimatedTotalPrice =
        projectCostPrice + produktionCostPrice + montageCostPrice;

    final estimatedMaterialPrice = getEstimatedMaterialPrice(isCostPrice);

    return estimatedTotalPrice + estimatedMaterialPrice;
  }
}

extension HourAggregateEx on HourAggregate? {
  // double get projectEstimatedHour {
  //   final calculationTypes = CalculationHourTypes.values.where(
  //       (element) => element.calculationTypes == CalculationTypes.Projekt);
  //   final filteredList = hourTypes
  //       .where((hour) =>
  //           calculationTypes.any((type) => hour.name.contains(type.name)))
  //       .toList();
  //
  //   return filteredList.fold(
  //       0.0, (previousValue, element) => element.totalHours + previousValue);
  // }

  double get projectHourSpent {
    if (this == null) return 0.0;

    final calculationTypes = CalculationHourTypes.values.where(
        (element) => element.calculationTypes == CalculationTypes.Projekt);
    final filteredList = this!
        .hourTypes
        .where((hour) =>
            calculationTypes.any((type) => hour.name.contains(type.name)))
        .toList();

    return filteredList.fold(
        0.0,
        (previousValue, element) =>
            (element.totalWorkHours ?? 0.0) + previousValue);
  }

  // double get productionEstimatedHour {
  //   final calculationTypes = CalculationHourTypes.values.where(
  //           (element) =>
  //       element.calculationTypes == CalculationTypes.Produktion);
  //   final filteredList = hourTypes
  //       .where((hour) =>
  //       calculationTypes.any((type) => hour.name.contains(type.name)))
  //       .toList();
  //
  //   return filteredList.fold(
  //       0.0, (previousValue, element) => element.totalHours + previousValue);
  // }

  double get productionHourSpent {
    if (this == null) return 0.0;
    final calculationTypes = CalculationHourTypes.values.where(
        (element) => element.calculationTypes == CalculationTypes.Produktion);
    final filteredList = this!
        .hourTypes
        .where((hour) =>
            calculationTypes.any((type) => hour.name.contains(type.name)))
        .toList();

    return filteredList.fold(
        0.0,
        (previousValue, element) =>
            (element.totalWorkHours ?? 0.0) + previousValue);
  }

  // double get montageEstimatedHour {
  //   final calculationTypes = CalculationHourTypes.values.where(
  //           (element) => element.calculationTypes == CalculationTypes.Montage);
  //   final filteredList = hourTypes
  //       .where((hour) =>
  //       calculationTypes.any((type) => hour.name.contains(type.name)))
  //       .toList();
  //
  //   return filteredList.fold(
  //       0.0, (previousValue, element) => element.totalHours + previousValue);
  // }

  double get montageHourSpent {
    if (this == null) return 0.0;
    final calculationTypes = CalculationHourTypes.values.where(
        (element) => element.calculationTypes == CalculationTypes.Montage);
    final filteredList = this!
        .hourTypes
        .where((hour) =>
            calculationTypes.any((type) => hour.name.contains(type.name)))
        .toList();

    return filteredList.fold(
        0.0,
        (previousValue, element) =>
            (element.totalWorkHours ?? 0.0) + previousValue);
  }

  double get totalHourSpent =>
      projectHourSpent + productionHourSpent + montageHourSpent;
}

extension EconomyEx on Economy {
  int get _materialCostPrice => materialsCostprice;

  double get calculatedHoursSalesPrice => _materialCostPrice + hoursSalesprice;

  double get costPrice => materialsCostprice + hoursCostprice;

  double get economyOffer => revisedOffer > 0 ? revisedOffer : offer;

  double get dekningsgrad =>
      (((economyOffer.toDouble() - costPrice) * 100) / economyOffer)
          .clamp(0.0, 100.0)
          .roundToDouble();
}

enum CalculationTypes { Projekt, Produktion, Montage }

enum CalculationHourTypes {
  kundemode.project('Kundemøde'),
  design.project('Design/tegning'),
  tilbudsgiving.project('Tilbudsgivning'),
  productionProjectManager.project('Produktion Projektleder'),
  productionJoiner.production('Produktion Snedker'),
  VrkfrertidpOrdre.production('Værkførertid på Ordre'),
  MontageProjektleder.project('Montage Projektleder'),
  TilsynProjektleder.project('Tilsyn Projektleder'),
  TilsynSnedker.montage('Tilsyn Snedker'),
  TransportSnedker.montage('Transport Snedker'),
  MontageSnedker.montage('Montage Snedker'),
  ;

  const CalculationHourTypes.project(this.name)
      : calculationTypes = CalculationTypes.Projekt;

  const CalculationHourTypes.production(this.name)
      : calculationTypes = CalculationTypes.Produktion;

  const CalculationHourTypes.montage(this.name)
      : calculationTypes = CalculationTypes.Montage;

  final String name;
  final CalculationTypes calculationTypes;
}

extension VacationStatusEx on VacationStatus {
  bool get isPending => this == VacationStatus.pending;

  bool get isApproved => this == VacationStatus.approved;

  bool get isRejected => this == VacationStatus.rejected;
}

extension VacationEx on Vacation {
  String get formattedDates =>
      '${calendar.startDate.formatDateShort}, ${calendar.endDate.formatDate}';
}

extension VacationListEx on List<Vacation> {
  bool isVacationValid(tz.TZDateTime startDate, tz.TZDateTime endDate) {
    // Iterate through each existing vacation for the user
    for (var vacation in this) {
      final vacationStartDate = vacation.calendar.startDate;
      final vacationEndDate = vacation.calendar.endDate;
      final adjustedStartDate = tz.TZDateTime(
        TimeZoneHelper.denmarkTimeZone,
        vacationStartDate.year,
        vacationStartDate.month,
        vacationStartDate.day,
      );

      final adjustedEndDate = tz.TZDateTime(
        TimeZoneHelper.denmarkTimeZone,
        vacationEndDate.year,
        vacationEndDate.month,
        vacationEndDate.day,
      );

      // Check if the new vacation's start or end date falls within any existing vacation range
      if (HelperMethod.isWithinRange(
              startDate, adjustedStartDate, adjustedEndDate) ||
          HelperMethod.isWithinRange(
              endDate, adjustedStartDate, adjustedEndDate) ||
          HelperMethod.isWithinRange(adjustedStartDate, startDate, endDate) ||
          HelperMethod.isWithinRange(adjustedEndDate, startDate, endDate)) {
        return false; // Invalid if there's any overlap
      }
    }

    // If all conditions are satisfied, the request is valid
    return true;
  }
}

extension HolidayEx on Holiday {
  String get formattedDates =>
      '${startDate.formatDateShort}, ${endDate.formatDate}';
}

extension HolidayListEx on List<Holiday> {
  bool isVacationValid(tz.TZDateTime startDate, tz.TZDateTime endDate) {
    // Iterate through each existing vacation for the user
    for (var vacation in this) {
      final adjustedStartDate = tz.TZDateTime(
        TimeZoneHelper.denmarkTimeZone,
        vacation.startDate.year,
        vacation.startDate.month,
        vacation.startDate.day,
      );

      final adjustedEndDate = tz.TZDateTime(
        TimeZoneHelper.denmarkTimeZone,
        vacation.endDate.year,
        vacation.endDate.month,
        vacation.endDate.day,
      );

      // Check if the new vacation's start or end date falls within any existing vacation range
      if (HelperMethod.isWithinRange(
              startDate, adjustedStartDate, adjustedEndDate) ||
          HelperMethod.isWithinRange(
              endDate, adjustedStartDate, adjustedEndDate) ||
          HelperMethod.isWithinRange(adjustedStartDate, startDate, endDate) ||
          HelperMethod.isWithinRange(adjustedEndDate, startDate, endDate)) {
        return false; // Invalid if there's any overlap
      }
    }

    // If all conditions are satisfied, the request is valid
    return true;
  }
}

extension UserEx on User {
  UserInfo get toUserInfo => UserInfo(
        id: id,
        fullName: fullName,
        initials: initials,
      );
}
