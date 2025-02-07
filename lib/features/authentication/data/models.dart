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
      name: json['user']['name'],
      secondName: json['user']['last_name'],
      email: json['user']['email'],
    );
  }

  User toEntity() {
    return User(
      name: name,
      email: email,
    );
  }
}

class LogInParameters {
  final String email;
  final String password;

  LogInParameters({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }
}
