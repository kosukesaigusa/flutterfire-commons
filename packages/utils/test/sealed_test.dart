import 'package:flutter_test/flutter_test.dart';
import 'package:utils/utils.dart';

void main() {
  group('sealed Result のテスト', () {
    test('when return Success', () {
      final Result<String> result = Success('200');
      final value = result.when((value) => value, (error) => error);
      expect(value, '200');
    });

    test('when return Error', () {
      final Result<String> result = Error(Exception('error'));
      final value = result.when((value) => value, (error) => error);
      expect(value.toString(), 'Exception: error');
    });
  });
}
