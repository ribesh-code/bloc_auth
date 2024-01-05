import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_auth/core/utils/extract_token_exp.dart';
import 'package:bloc_auth/core/utils/extract_token_user.dart';
import 'package:bloc_auth/domain/contracts/local_datasource_contract/local_datasource_contract.dart';
import 'package:bloc_auth/domain/entity/login_credentials.dart';
import 'package:bloc_auth/domain/entity/user_entity.dart';
import 'package:bloc_auth/feature/auth/usecase/login_usecase.dart';
import 'package:bloc_auth/injection.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required this.loginUseCase,
    required this.localStorage,
  }) : super(const AuthState.unknown()) {
    on<Initialize>(_onInitialize);
    on<LogIn>(_onSignIn);
    on<LogOut>(_onSignOut);
  }

  final LoginUseCase loginUseCase;
  final LocalDataSourceContract localStorage;

  Future<void> _onInitialize(
    Initialize event,
    Emitter<AuthState> emit,
  ) async {
    final token = await localStorage.get(key: 'token');
    if (token != null) {
      if (await isTokenExpired(tokenValue: token)) {
        await localStorage.delete(key: 'token');
        emit(const AuthState.tokenExpired());
        emit(const AuthState.unauthenticated());
      } else {
        final user = await extractTokenUser();
        emit(AuthState.authenticated(user: user));
      }
    } else {
      emit(const AuthState.unauthenticated());
    }
  }

  Future<void> _onSignIn(LogIn event, Emitter<AuthState> emit) async {
    emit(const AuthState.authenticating());
    final result = await loginUseCase(event.credentials);
    await result.fold(
      (l) {
        emit(AuthState.error(errorCode: l.message));
      },
      (r) async {
        final token = await localStorage.save(
          key: 'token',
          value: r.token,
        );
        if (token) {
          final user = await extractTokenUser();
          emit(AuthState.authenticated(user: user));
        }
      },
    );
  }

  Future<void> _onSignOut(LogOut event, Emitter<AuthState> emit) async {
    if (state.status != AuthStatus.authenticated) {
      return;
    }
    emit(const AuthState.loggingOut());
    try {
      final token = await localStorage.get(key: 'token');
      if (token != null) {
        await localStorage.delete(key: 'token');
      }
    } catch (e) {
      log(e.toString());
    }
    emit(const AuthState.unauthenticated());
  }
}

Future<bool> isTokenExpired({String? tokenValue}) async {
  final token = tokenValue ??
      await getItInstance<LocalDataSourceContract>().get(key: 'token');
  if (token != null) {
    final tokenExp = extractExpiryFromToken(token);
    if (tokenExp != null && DateTime.now().isAfter(tokenExp)) {
      return true;
    }
  }
  return false;
}
