import 'dart:developer';

import 'package:bloc_auth/domain/contracts/auth/auth_contract.dart';
import 'package:bloc_auth/domain/contracts/local_datasource_contract/local_datasource_contract.dart';
import 'package:bloc_auth/feature/auth/bloc/auth_bloc.dart';
import 'package:bloc_auth/feature/auth/usecase/login_usecase.dart';
import 'package:bloc_auth/infrastructure/local_datasource/local_datasource_impl.dart';
import 'package:bloc_auth/infrastructure/network/network_client.dart';
import 'package:bloc_auth/infrastructure/repo/auth_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

final getItInstance = GetIt.I;

Future<Box<String>> initHive() async {
  log('Hive running ✅');
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  return Hive.openBox<String>('token');
}

Future<void> init() async {
  final box = await initHive();

  getItInstance
    ..registerSingleton<Box<String>>(box)
    ..registerSingleton<LocalDataSourceContract>(
      LocalDataSourceImpl(box),
    )
    ..registerSingleton<NetWorkClient>(NetWorkClient())
    ..registerSingleton<AuthContract>(
      AuthRepoImpl(
        client: getItInstance<NetWorkClient>(),
      ),
    )
    ..registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(
        authContract: getItInstance<AuthContract>(),
      ),
    )
    ..registerLazySingleton(
      () => AuthBloc(
        localStorage: getItInstance<LocalDataSourceContract>(),
        loginUseCase: getItInstance<LoginUseCase>(),
      ),
    );
}
