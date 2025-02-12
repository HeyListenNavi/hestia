class Guest {
  final String name;
  final String lastName;
  final String phoneNumber;
  final String email;

  Guest({
    required this.name,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
  });
}

class Code {
  final String? id;
  final String title;
  final String? code;
  final String? status;
  final String visitorsNumber;
  final String entranceDateTime;
  final String description;

  Code({
    this.id,
    required this.title,
    this.code,
    this.status,
    required this.visitorsNumber,
    required this.entranceDateTime,
    required this.description,
  });
}

class Invitation {
  final Guest guest;
  final Code code;

  Invitation({
    required this.guest,
    required this.code,
  });
}
