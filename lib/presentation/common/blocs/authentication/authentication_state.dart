part of 'authentication_bloc.dart';

sealed class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {
  final String name;
  AuthenticationSuccess(this.name);
}

class AuthenticationFailure extends AuthenticationState {
  final String errorMessage;
  AuthenticationFailure(this.errorMessage);
}