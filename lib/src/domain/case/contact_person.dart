import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_person.freezed.dart';
part 'contact_person.g.dart';

@freezed
class ContactPerson with _$ContactPerson {
  const factory ContactPerson({
    String? name,
    String? phoneNumber,
  }) = _ContactPerson;

  factory ContactPerson.fromJson(Map<String, dynamic> json) =>
      _$ContactPersonFromJson(json);
}
