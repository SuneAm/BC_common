class ResponsibleUser {
  final String fullName;

  ResponsibleUser({
    required this.fullName,
  });

  factory ResponsibleUser.fromJson(Map<String, dynamic> json) {
    return ResponsibleUser(
      fullName: json['fullName'] ?? 'Projektleder',
    );
  }

  Map<String, dynamic> toFirestore() => {'fullName': fullName};
}
