import 'package:dio/dio.dart';

class MyDioException implements Exception {
  late String errorMessage;

  MyDioException.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        errorMessage = 'dio_exception.cancel';
        break;
      case DioExceptionType.connectionError:
        errorMessage = 'dio_exception.connection_error';
        break;
      case DioExceptionType.connectionTimeout:
        errorMessage = 'dio_exception.connection_timeout';
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = 'dio_exception.receive_timeout';
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = 'dio_exception.send_timeout';
        break;
      case DioExceptionType.badResponse:
        errorMessage =
            'dio_exception.bad_response.${dioError.response?.statusCode ?? 'default'}';
        break;
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          errorMessage = 'dio_exception.no_internet';
          break;
        }
        errorMessage = 'dio_exception.unknown';
        break;
      default:
        errorMessage = 'dio_exception.default';
        break;
    }
  }

  @override
  String toString() => errorMessage;
}
