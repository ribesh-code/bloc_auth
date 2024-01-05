import 'package:bloc_auth/core/errors/app_error.dart';
import 'package:bloc_auth/domain/entity/login_credentials.dart';
import 'package:bloc_auth/infrastructure/dto/token_dto.dart';
import 'package:dartz/dartz.dart';

abstract class AuthContract {
  Future<Either<AppError, Token>> login({
    required LoginCredentials credentials,
  });
}
