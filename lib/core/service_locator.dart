import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hestia/core/routing/router.dart';
import 'package:hestia/features/authentication/data/data_sources.dart';
import 'package:hestia/features/authentication/data/repository.dart';
import 'package:hestia/features/authentication/domain/repository.dart';
import 'package:hestia/features/authentication/domain/use_cases.dart';
import 'package:hestia/features/invitation_management/data/data_sources.dart';
import 'package:hestia/features/invitation_management/data/repository.dart';
import 'package:hestia/features/invitation_management/domain/use_cases.dart';

final services = GetIt.instance;

Future<void> initializeServices() async {
  services.registerLazySingleton<AppRouter>(() {
    return AppRouter();
  });

  services.registerLazySingleton<Dio>(() {
    return Dio();
  });

  services.registerLazySingleton<AuthenticationApiDataSource>(() {
    return AuthenticationApiDataSource();
  });

  services.registerLazySingleton<InvitationManagementApiDataSource>(() {
    return InvitationManagementApiDataSource();
  });

  services.registerLazySingleton<FlutterSecureStorage>(() {
    return FlutterSecureStorage();
  });

  services.registerSingleton<AuthenticationRepository>(
    AuthenticationRepositoryImpl(),
  );

  services.registerSingleton<InvitationManagementRepositoryImpl>(
    InvitationManagementRepositoryImpl(),
  );

  services.registerLazySingleton<LogInUseCase>(() {
    return LogInUseCase(repository: services<AuthenticationRepository>());
  });

  services.registerLazySingleton<CreateInvitationUseCase>(() {
    return CreateInvitationUseCase(repository: services<InvitationManagementRepositoryImpl>());
  });
}
