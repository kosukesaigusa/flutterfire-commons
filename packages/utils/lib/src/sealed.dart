import 'package:meta/meta.dart';

@sealed
abstract class Result<T> {
  R whenWithResult<R>(
    R Function(Success<T>) success,
    R Function(Error) error,
  ) {
    if (this is Success<T>) {
      return success(this as Success<T>);
    } else if (this is Error) {
      return error(this as Error);
    } else {
      throw Exception('Unhendled part, could be anything');
    }
  }
}

class Success<T> extends Result<T> {
  final T value;

  Success(this.value);
}

class Error<T> extends Result<T> {
  final Exception exception;

  Error(this.exception);
}
