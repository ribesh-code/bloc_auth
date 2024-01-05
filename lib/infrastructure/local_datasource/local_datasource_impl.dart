import 'package:bloc_auth/domain/contracts/local_datasource_contract/local_datasource_contract.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalDataSourceImpl extends LocalDataSourceContract {
  LocalDataSourceImpl(this._box);

  final Box<String> _box;
  @override
  Future<bool> delete({required String key}) async {
    await _box.delete(key);
    return true;
  }

  @override
  Future<String?> get({required String key}) async {
    return _box.get(key);
  }

  @override
  Future<bool> save({required String key, required String value}) async {
    await _box.put(key, value);
    return true;
  }
}
