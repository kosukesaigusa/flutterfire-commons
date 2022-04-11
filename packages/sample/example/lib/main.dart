import 'package:flutter/material.dart';
import 'package:sample/sample.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  static const path = '/my-home/';
  static const name = 'MyHome';

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int _addingCounter = 0;
  int _subtractingCounter = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Adding Counter: $_addingCounter'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _addingCounter = Calculator().addOne(_addingCounter);
                });
              },
              child: const Text('Add one!'),
            ),
            const SizedBox(height: 32),
            Text('Subtracting Counter: $_subtractingCounter'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _subtractingCounter = Calculator().subtractOne(_subtractingCounter);
                });
              },
              child: const Text('Subtract one!'),
            ),
          ],
        ),
      ),
    );
  }
}
