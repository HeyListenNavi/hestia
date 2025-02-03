part of 'authentication_bloc.dart';

sealed class AuthenticationEvent {}

final class AuthenticationLogIn extends AuthenticationEvent {
  final LogInParameters parameters;

  AuthenticationLogIn(this.parameters);
}