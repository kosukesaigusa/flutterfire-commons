import 'package:flutter_test/flutter_test.dart';
import 'package:utils/utils.dart';

void main() {
  test('lastDayOfMonth メソッドのテスト', () {
    expect(lastDayOfMonth(2022, 4), 30);
    expect(lastDayOfMonth(2022, 3), 31);
    expect(lastDayOfMonth(2022, 2), 28);
    expect(lastDayOfMonth(2020, 2), 29);
  });
}
