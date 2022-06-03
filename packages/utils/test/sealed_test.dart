import 'package:flutter_test/flutter_test.dart';
import 'package:utils/utils.dart';

void main() {
  group('sealed Result のテスト', () {
    test('when return Success', () {
      final Result<String> result = Success('200');
      final value = result.whenWithResult((p0) => 'Success', (p0) => 'error');
      expect(value, 'Success');
    });

    test('when return Error', () {
      final Result<String> result = Error(Exception('401'));
      final value = result.whenWithResult((p0) => 'Success', (p0) => 'error');
      expect(value, 'error');
    });
  });
}
