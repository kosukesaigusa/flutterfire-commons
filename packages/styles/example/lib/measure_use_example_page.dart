import 'package:flutter/material.dart';
import 'package:styles/styles.dart';

class MeasureUseExamplePage extends StatelessWidget {
  const MeasureUseExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Padding(
                  padding: Measure.paddingA12,
                  child: Text(
                    '0',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 85),
                  ),
                ),
                Measure.gap12
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                CalculatorButton(
                  buttonText: 'AC',
                  buttonColor: Colors.grey,
                  numberColor: Colors.black,
                ),
                CalculatorButton(
                  buttonText: '+/-',
                  buttonColor: Colors.grey,
                  numberColor: Colors.black,
                ),
                CalculatorButton(
                  buttonText: '%',
                  buttonColor: Colors.grey,
                  numberColor: Colors.black,
                ),
                CalculatorButton(
                  buttonText: '÷',
                  buttonColor: Colors.amber,
                  numberColor: Colors.white,
                ),
              ],
            ),
            Measure.gap12,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  buttonText: '7',
                  buttonColor: Colors.grey.shade700,
                  numberColor: Colors.white,
                ),
                CalculatorButton(
                  buttonText: '8',
                  buttonColor: Colors.grey.shade700,
                  numberColor: Colors.white,
                ),
                CalculatorButton(
                  buttonText: '9',
                  buttonColor: Colors.grey.shade700,
                  numberColor: Colors.white,
                ),
                CalculatorButton(
                  buttonText: 'x',
                  buttonColor: Colors.amber.shade700,
                  numberColor: Colors.white,
                ),
              ],
            ),
            Measure.gap12,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  buttonText: '4',
                  buttonColor: Colors.grey.shade700,
                  numberColor: Colors.white,
                ),
                CalculatorButton(
                  buttonText: '5',
                  buttonColor: Colors.grey.shade700,
                  numberColor: Colors.white,
                ),
                CalculatorButton(
                  buttonText: '6',
                  buttonColor: Colors.grey.shade700,
                  numberColor: Colors.white,
                ),
                CalculatorButton(
                  buttonText: '-',
                  buttonColor: Colors.amber.shade700,
                  numberColor: Colors.white,
                ),
              ],
            ),
            Measure.gap12,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  buttonText: '1',
                  buttonColor: Colors.grey.shade700,
                  numberColor: Colors.white,
                ),
                CalculatorButton(
                  buttonText: '2',
                  buttonColor: Colors.grey.shade700,
                  numberColor: Colors.white,
                ),
                CalculatorButton(
                  buttonText: '3',
                  buttonColor: Colors.grey.shade700,
                  numberColor: Colors.white,
                ),
                CalculatorButton(
                  buttonText: '+',
                  buttonColor: Colors.amber.shade700,
                  numberColor: Colors.white,
                ),
              ],
            ),
            Measure.gap12,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 80,
                  width: 173,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey.shade700,
                      shape: const StadiumBorder(),
                      padding: Measure.paddingA12 +
                          Measure.paddingL12 +
                          Measure.paddingR16 * 6,
                    ),
                    child: const Text(
                      '0',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
                CalculatorButton(
                  buttonText: '.',
                  buttonColor: Colors.grey.shade700,
                  numberColor: Colors.white,
                ),
                CalculatorButton(
                  buttonText: '=',
                  buttonColor: Colors.amber.shade700,
                  numberColor: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({
    Key? key,
    required this.buttonText,
    required this.buttonColor,
    required this.numberColor,
  }) : super(key: key);

  final String buttonText;
  final Color buttonColor, numberColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 80,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          shape: const CircleBorder(),
          padding: Measure.paddingA12,
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 35,
            color: numberColor,
          ),
        ),
      ),
    );
  }
}
