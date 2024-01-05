import 'package:bloc_auth/domain/contracts/error_contracts.dart';

class UnsupportedEnvironmentError implements ErrorContract {
  UnsupportedEnvironmentError({required this.message});

  @override
  final String message;

  @override
  String toString() => message;
}
