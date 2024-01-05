part of 'auth_bloc.dart';

class AuthEvent {}

class Initialize extends AuthEvent {}

class LogIn extends AuthEvent {
  LogIn(this.credentials);

  final LoginCredentials credentials;
}

class LogOut extends AuthEvent {}
