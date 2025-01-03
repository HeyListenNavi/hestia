import 'package:dartz/dartz.dart';
import 'package:hestia/features/authentication/data/models.dart';
import 'package:hestia/features/authentication/domain/repository.dart';

class SignUpUseCase {
  final AuthenticationRepository repository;

  SignUpUseCase({required this.repository});

  Future<Either> call(SignUpParameters parameters) async {
    return repository.signUp(parameters);
  }
}

class LogInUseCase {
  final AuthenticationRepository repository;

  LogInUseCase({required this.repository});

  Future<Either> call(LogInParameters parameters) async {
    return repository.logIn(parameters);
  }
}