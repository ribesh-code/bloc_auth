import 'package:bloc_auth/domain/contracts/error_contracts.dart';

class AppError implements ErrorContract {
  AppError({required this.message});

  @override
  final String message;

  @override
  String toString() => message;
}
