abstract class LocalDataSourceContract {
  Future<String?> get({required String key});
  Future<bool> save({required String key, required String value});
  Future<bool> delete({required String key});
}
