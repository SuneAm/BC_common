import 'package:ordrestyring_common/src/domain/case/economy.dart';
import 'package:ordrestyring_common/src/domain/case/hour_aggregate.dart';

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
