import 'package:flutter_test/flutter_test.dart';
import 'package:styles/styles.dart';

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

  test('Measure クラスの padding 定数のテスト', () {
    expect(Measure.paddingL4 + Measure.paddingR4, Measure.paddingH4);
    expect(Measure.paddingB4 + Measure.paddingT4, Measure.paddingV4);
    expect(Measure.paddingV4 + Measure.paddingH4, Measure.paddingA4);
    expect(Measure.paddingL8 + Measure.paddingR8, Measure.paddingH8);
    expect(Measure.paddingB8 + Measure.paddingT8, Measure.paddingV8);
    expect(Measure.paddingV8 + Measure.paddingH8, Measure.paddingA8);
    expect(Measure.paddingL16 + Measure.paddingR16, Measure.paddingH16);
    expect(Measure.paddingB16 + Measure.paddingT16, Measure.paddingV16);
    expect(Measure.paddingV16 + Measure.paddingH16, Measure.paddingA16);
  });
}
