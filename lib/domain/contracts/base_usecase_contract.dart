import 'package:bloc_auth/domain/contracts/error_contracts.dart';
import 'package:dartz/dartz.dart';

abstract class BaseUseCase<Type, Params> {
  Future<Either<ErrorContract, Type>> call(Params params);
}
