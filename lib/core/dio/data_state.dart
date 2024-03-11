abstract class DataState<T> {
  final T? data;
  final int? statusCode;
  final String? error;

  const DataState({this.data, this.statusCode, this.error});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T? data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(String? error, int? statusCode)
      : super(error: error, statusCode: statusCode);
}
