import 'package:meta/meta.dart';

@sealed
abstract class Result<T> {
  R when<R>(
    R Function(T) success,
    R Function(Exception) error,
  ) {
    if (this is Success<T>) {
      return success((this as Success<T>).value);
    } else if (this is Error) {
      return error((this as Error).exception);
    } else {
      throw Exception('Unhandled part, could be anything');
    }
  }
}

class Success<T> extends Result<T> {
  Success(this.value);
  final T value;
}

class Error<T> extends Result<T> {
  Error(this.exception);
  final Exception exception;
}
