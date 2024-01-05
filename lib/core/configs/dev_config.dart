import 'package:bloc_auth/core/configs/app_config.dart';

class DevConfig extends AppConfig {
  @override
  Future<void> load() async {}

  @override
  String get environment => 'DEV';
}
