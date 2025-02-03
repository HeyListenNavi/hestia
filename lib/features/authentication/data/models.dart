import 'package:hestia/features/authentication/domain/entities.dart';

class UserModel extends User {
  final String secondName;

  UserModel({
    required super.name,
    required super.email,
    required this.secondName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      secondName: json['last_name'],
      email: json['email'],
    );
  }

  User toEntity() {
    return User(
      name: '$name $secondName',
      email: email,
    );
  }
}

abstract class ApiParameters {
  Map<String, dynamic> toJson();
}

class SignUpParameters extends ApiParameters {
  final String name;
  final String secondName;
  final String phoneNumber;
  final String email;
  final String password;

  SignUpParameters({
    required this.name,
    required this.email,
    required this.secondName,
    required this.phoneNumber,
    required this.password,
  });

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'last_name': secondName,
      'phone_number': phoneNumber,
      'email': email,
      'password': password,
    };
  }
}

class LogInParameters extends ApiParameters {
  final String email;
  final String password;

  LogInParameters({
    required this.email,
    required this.password,
  });

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }
}
