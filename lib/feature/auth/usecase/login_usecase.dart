import 'package:bloc_auth/core/errors/app_error.dart';
import 'package:bloc_auth/domain/contracts/auth/auth_contract.dart';
import 'package:bloc_auth/domain/contracts/base_usecase_contract.dart';
import 'package:bloc_auth/domain/contracts/error_contracts.dart';
import 'package:bloc_auth/domain/entity/login_credentials.dart';
import 'package:bloc_auth/infrastructure/dto/token_dto.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase extends BaseUseCase<Token, LoginCredentials> {
  LoginUseCase({required this.authContract});

  final AuthContract authContract;
  @override
  Future<Either<ErrorContract, Token>> call(LoginCredentials params) async {
    final result = await authContract.login(credentials: params);
    return result.fold(
      (l) => left(
        AppError(
          message: l.message,
        ),
      ),
      (r) => right(
        Token(
          token: r.token,
        ),
      ),
    );
  }
}
