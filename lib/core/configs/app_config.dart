import 'package:bloc_auth/core/errors/unsupported_env.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class AppConfig {
  Future<void> load();
  String get baseUrl => mustGetEnv('BASE_URL');

  String get environment;

  String mustGetEnv(String name) {
    if (!dotenv.env.containsKey(name)) {
      throw UnsupportedEnvironmentError(
        message: '$name is not defined in .env file',
      );
    }

    final item = dotenv.env[name];
    if (item == null) {
      throw UnsupportedEnvironmentError(
        message: '$name is not defined in .env file',
      );
    }

    return item;
  }
}
