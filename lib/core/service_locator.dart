import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hestia/core/routing/router.dart';
import 'package:hestia/features/authentication/data/data_sources.dart';
import 'package:hestia/features/authentication/data/repository.dart';
import 'package:hestia/features/authentication/domain/repository.dart';
import 'package:hestia/features/authentication/domain/use_cases.dart';

final services = GetIt.instance;

Future<void> initializeServices() async {
  services.registerLazySingleton<AppRouter>(
    () {
      return AppRouter();
    },
  );

  services.registerLazySingleton<Dio>(() {
    return Dio();
  });

  services.registerLazySingleton<ApiDataSource>(() {
    return ApiDataSource();
  });

  services.registerLazySingleton<FlutterSecureStorage>(() {
    return FlutterSecureStorage();
  });

  services.registerSingleton<AuthenticationRepository>(
    AuthenticationRepositoryImpl()
  );

  services.registerLazySingleton<SignUpUseCase>(() {
    return SignUpUseCase(repository: services<AuthenticationRepository>());
  });

  services.registerLazySingleton<LogInUseCase>(() {
    return LogInUseCase(repository: services<AuthenticationRepository>());
  });
}
