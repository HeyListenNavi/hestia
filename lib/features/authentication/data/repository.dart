import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hestia/core/service_locator.dart';
import 'package:hestia/features/authentication/data/data_sources.dart';
import 'package:hestia/features/authentication/data/models.dart';
import 'package:hestia/features/authentication/domain/repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  @override
  Future<Either> logIn(LogInParameters parameters) async {
    Either result = await services<AuthenticationApiDataSource>().logIn(parameters);

    return result.fold(
      (error) {
        return Left(error);
      },
      (userData) async {
        final user = UserModel.fromJson(userData).toEntity();
        await services<FlutterSecureStorage>().write(key: 'authentication_token', value: userData['token']);
        return Right(user);
      }
    );
  }
}
