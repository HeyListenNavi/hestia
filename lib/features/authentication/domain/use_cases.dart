import 'package:dartz/dartz.dart';
import 'package:hestia/features/authentication/data/models.dart';
import 'package:hestia/features/authentication/domain/repository.dart';

class LogInUseCase {
  final AuthenticationRepository repository;

  LogInUseCase({required this.repository});

  Future<Either> call(LogInParameters parameters) async {
    return repository.logIn(parameters);
  }
}