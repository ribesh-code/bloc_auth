part of 'auth_bloc.dart';

enum AuthStatus {
  authenticated,
  unauthenticated,
  unknown,
  authenticating,
  error,
  loggingOut,
  tokenExpired,
}

class AuthState extends Equatable {
  const AuthState._({
    this.status = AuthStatus.unknown,
    this.user,
    this.errorCode = '',
  });

  const AuthState.unknown() : this._();
  const AuthState.authenticating() : this._(status: AuthStatus.authenticating);
  const AuthState.authenticated({required UserEntity user})
      : this._(status: AuthStatus.authenticated, user: user);
  const AuthState.error({required String errorCode})
      : this._(status: AuthStatus.error, errorCode: errorCode);
  const AuthState.unauthenticated()
      : this._(status: AuthStatus.unauthenticated);
  const AuthState.loggingOut() : this._(status: AuthStatus.loggingOut);
  const AuthState.tokenExpired() : this._(status: AuthStatus.tokenExpired);

  final AuthStatus status;
  final String errorCode;
  final UserEntity? user;

  @override
  List<Object> get props => [status];
}
