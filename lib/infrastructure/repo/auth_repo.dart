import 'package:bloc_auth/core/errors/app_error.dart';
import 'package:bloc_auth/domain/contracts/auth/auth_contract.dart';
import 'package:bloc_auth/domain/entity/login_credentials.dart';
import 'package:bloc_auth/infrastructure/dto/token_dto.dart';
import 'package:bloc_auth/infrastructure/network/network_client.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepoImpl extends AuthContract {
  AuthRepoImpl({required this.client});

  final NetWorkClient client;
  @override
  Future<Either<AppError, Token>> login(
      {required LoginCredentials credentials}) async {
    try {
      final response = await client.post(
        '/login',
        data: {
          'username': credentials.username,
          'password': credentials.password,
        },
      );
      final token = Token.fromJson(response.data);
      return right(token);
    } on DioException catch (e) {
      final errorMessage = e.response?.data['error'];
      return left(AppError(message: errorMessage));
    } catch (e) {
      return left(AppError(message: 'Something went wrong'));
    }
  }
}
