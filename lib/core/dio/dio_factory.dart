import 'package:dio/dio.dart';

import 'logger_interceptor.dart';

class DioFactory {
  final String _baseUrl;

  DioFactory(this._baseUrl);

  BaseOptions _createBaseOptions() => BaseOptions(
        baseUrl: _baseUrl,
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        connectTimeout: const Duration(seconds: 30),
      );

  Dio create() =>
      Dio(_createBaseOptions())..interceptors.addAll([LoggerInterceptor()]);
}
