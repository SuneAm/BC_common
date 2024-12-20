import 'package:ordrestyring_common/ordrestyring_common.dart';

extension CaseEstimatedHourEx on CaseEstimatedHour? {
  double get projectEstimatedHour => this?.estimatedProjectHour ?? 0;

  double get productionEstimatedHour => this?.estimatedProductionHour ?? 0;

  double get montageEstimatedHour => this?.estimatedMontageHour ?? 0;

  double get estimatedMaterialPrice => this?.estimatedMaterialPrice ?? 0.0;

  double get totalEstimatedHour =>
      (projectEstimatedHour + productionEstimatedHour + montageEstimatedHour);
}

extension HourAggregateEx on HourAggregate {
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
    final calculationTypes = CalculationHourTypes.values.where(
        (element) => element.calculationTypes == CalculationTypes.Projekt);
    final filteredList = hourTypes
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
    final calculationTypes = CalculationHourTypes.values.where(
        (element) => element.calculationTypes == CalculationTypes.Produktion);
    final filteredList = hourTypes
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
    final calculationTypes = CalculationHourTypes.values.where(
        (element) => element.calculationTypes == CalculationTypes.Montage);
    final filteredList = hourTypes
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
      '${startDate.formatEventDateShort}, ${endDate.formatDate}';
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
      '${startDate.formatEventDateShort}, ${endDate.formatDate}';
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
