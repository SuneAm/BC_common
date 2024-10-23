import 'package:freezed_annotation/freezed_annotation.dart';

import 'holiday.dart';
import 'vacation.dart';

part 'vacation_wrapper.freezed.dart';

@freezed
abstract class VacationWrapper with _$VacationWrapper {
  const factory VacationWrapper.holiday(Holiday holiday) =
      _HolidayVacationWrapper;
  const factory VacationWrapper.vacation(Vacation vacation) =
      _VacationVacationWrapper;
}
