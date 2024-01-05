import 'package:bloc_auth/core/configs/dev_config.dart';
import 'package:dio/dio.dart';

class NetWorkClient {
  factory NetWorkClient() {
    return _instance;
  }
  NetWorkClient._privateConstructor() {
    _dio.interceptors.addAll([
      LogInterceptor(
        responseBody: true,
        requestBody: true,
      ),
    ]);
  }

  static final BaseOptions _options = BaseOptions(
    baseUrl: DevConfig().baseUrl,
    receiveTimeout: const Duration(milliseconds: 5000),
    sendTimeout: const Duration(milliseconds: 5000),
  );

  final Dio _dio = Dio(_options);

  static final NetWorkClient _instance = NetWorkClient._privateConstructor();

  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _dio.post<T>(
      path,
      data: data,
      cancelToken: cancelToken,
      options: options,
    );
  }

  Future<Response<dynamic>> delete(
    String path, {
    Options? options,
  }) {
    return _dio.delete(
      path,
      options: options,
    );
  }

  Future<Response<dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return _dio.get(path, queryParameters: queryParameters, options: options);
  }

  Dio get dio => _dio;
}
