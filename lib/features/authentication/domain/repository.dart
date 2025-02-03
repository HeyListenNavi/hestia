import 'package:dartz/dartz.dart';
import 'package:hestia/features/authentication/data/models.dart';

abstract class AuthenticationRepository {
  Future<Either> logIn(LogInParameters parameters); 
}