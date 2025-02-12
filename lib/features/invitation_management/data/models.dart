import 'package:hestia/features/invitation_management/domain/entities.dart';
import 'package:intl/intl.dart';

class InvitationModel extends Invitation {
  InvitationModel({
    required super.code,
    required super.guest,
  });

  factory InvitationModel.fromJson(Map<String, dynamic> json) {
    return InvitationModel(
      code: Code(
        id: json['code']['id'],
        title: json['code']['subject'],
        code: json['code']['code'],
        status: json['code']['status'],
        visitorsNumber: json['code']['visitors_number'],
        entranceDateTime: json['code']['scheduled'],
        description: json['code']['description'],
      ),
      guest: Guest(
        name: json['guest']['name'],
        lastName: json['guest']['last_name'],
        phoneNumber: json['guest']['phone_number'],
        email: json['guest']['email'],
      ),
    );
  }
  Map<String, dynamic> toJson() {
    String entryDate = DateFormat('yyyy-MM-dd').format(DateTime.parse(code.entranceDateTime));
    String entryTime = DateFormat('HH:mm:ss').format(DateTime.parse(code.entranceDateTime));

    return <String, dynamic>{
      'code': {
        'subject': code.title,
        'visitors_number': code.visitorsNumber,
        'entry_date': entryDate,
        'entry_time': entryTime,
        'description': code.description,
      },
      'guest': {
        'name': guest.name,
        'last_name': guest.lastName,
        'phone_number': guest.phoneNumber,
        'email': guest.email,
      }
    };
  }

  Invitation toEntity() {
    return Invitation(
      guest: guest,
      code: code,
    );
  }
}

class CodeModel extends Code {
  CodeModel({
    required super.id,
    required super.title,
    required super.code,
    required super.status,
    required super.visitorsNumber,
    required super.entranceDateTime,
    required super.description,
  });

  factory CodeModel.fromJson(Map<String, dynamic> json) {
    return CodeModel(
      id: json['id'],
      title: json['subject'],
      code: json['code'],
      status: json['status'],
      visitorsNumber: json['visitors_number'],
      entranceDateTime: json['scheduled'],
      description: json['subject'],
    );
  }

  Code toEntity() {
    return Code(
      id: id,
      title: title,
      code: code,
      status: status,
      visitorsNumber: visitorsNumber,
      entranceDateTime: entranceDateTime,
      description: description,
    );
  }
}
