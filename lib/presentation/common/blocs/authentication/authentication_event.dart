part of 'authentication_bloc.dart';

sealed class AuthenticationEvent {}

final class AuthenticationSignUp extends AuthenticationEvent {
  final SignUpParameters parameters;

  AuthenticationSignUp(this.parameters);
}

final class AuthenticationLogIn extends AuthenticationEvent {
  final LogInParameters parameters;

  AuthenticationLogIn(this.parameters);
}