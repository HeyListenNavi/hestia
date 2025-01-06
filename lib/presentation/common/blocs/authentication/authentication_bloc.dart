import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hestia/core/service_locator.dart';
import 'package:hestia/features/authentication/data/models.dart';
import 'package:hestia/features/authentication/domain/use_cases.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticationSignUp>(
      (event, emit) async {
        emit(AuthenticationLoading());

        final Either response = await services<SignUpUseCase>().call(event.parameters);
        response.fold(
          (error) {
            emit(AuthenticationFailure(error));
          },
          (data) {
            emit(AuthenticationSuccess(data.name));
          },
        );
      }
    );
    on<AuthenticationLogIn>(
      (event, emit) async {
        emit(AuthenticationLoading());

        final Either response = await services<LogInUseCase>().call(event.parameters);
        response.fold(
          (error) {
            emit(AuthenticationFailure(error));
          },
          (data) {
            emit(AuthenticationSuccess(data.name));
          }
        );
      }
    );
  }
}