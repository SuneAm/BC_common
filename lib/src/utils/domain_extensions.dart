import 'package:ordrestyring_common/ordrestyring_common.dart';

extension CaseCalendarEx on CaseCalendar? {
  String get toFormattedDates => this == null
      ? ''
      : '${this!.startDate.formatDateShort} - ${this!.endDate.formatDateShort}';
}

extension AssignmentCalendarEx on AssignmentCalendar? {
  String get toFormattedDates => this == null
      ? ''
      : '${this!.startDate.formatDateShort} - ${this!.endDate.formatDateShort}';
}

extension CaseEstimatedHourEx on CaseEstimatedHour? {
  double get estimatedProjectHour => this?.estimatedProjectHour ?? 0;

  double get estimatedProductionHour => this?.estimatedProductionHour ?? 0;

  double get estimatedMontageHour => this?.estimatedMontageHour ?? 0;

  double get estimatedMaterialPrice => this?.estimatedMaterialPrice ?? 0.0;

  double get totalEstimatedHour =>
      (estimatedProjectHour + estimatedProductionHour + estimatedMontageHour);
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
  productionProjectManager.production('Produktion Projektleder'),
  productionJoiner.production('Produktion Snedker'),
  VrkfrertidpOrdre.production('Værkførertid på Ordre'),
  MontageProjektleder.montage('Montage Projektleder'),
  TilsynProjektleder.montage('Tilsyn Projektleder'),
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
      '${startDate.formatDateShort}, ${endDate.formatDate}';
}

extension VacationListEx on List<Vacation> {
  bool isVacationValid(DateTime startDate, DateTime endDate) {
    // Iterate through each existing vacation for the user
    for (var vacation in this) {
      final adjustedStartDate = DateTime(
        vacation.startDate.year,
        vacation.startDate.month,
        vacation.startDate.day,
      );

      final adjustedEndDate = DateTime(
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

extension HolidayEx on Holiday {
  String get formattedDates =>
      '${startDate.formatDateShort}, ${endDate.formatDate}';
}

extension HolidayListEx on List<Holiday> {
  bool isVacationValid(DateTime startDate, DateTime endDate) {
    // Iterate through each existing vacation for the user
    for (var vacation in this) {
      final adjustedStartDate = DateTime(
        vacation.startDate.year,
        vacation.startDate.month,
        vacation.startDate.day,
      );

      final adjustedEndDate = DateTime(
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
