sealed class ApiResponse<T> {}

class Success<T> extends ApiResponse<T> {
  final T data;
  Success(this.data);
}

class Failure<T> extends ApiResponse<T> {
  final String message;
  final int? statusCode;

  Failure(this.message, {this.statusCode});
}