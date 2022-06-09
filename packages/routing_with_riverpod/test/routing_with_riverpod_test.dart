import 'package:flutter_test/flutter_test.dart';
import 'package:routing_with_riverpod/routing_with_riverpod.dart';

void main() {
  test('Calculator クラスの addOne メソッドのテスト', () {
    final calculator = Calculator();
    expect(calculator.addOne(2), 3);
    expect(calculator.addOne(-7), -6);
    expect(calculator.addOne(0), 1);
  });

  test('Calculator クラスの subtractOne メソッドのテスト', () {
    final calculator = Calculator();
    expect(calculator.subtractOne(2), 1);
    expect(calculator.subtractOne(-7), -8);
    expect(calculator.subtractOne(0), -1);
  });
}
