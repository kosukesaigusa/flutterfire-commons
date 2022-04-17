import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gallery/gallery.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
  final DocumentReference<Map<String, dynamic>> _counterRef =
      FirebaseFirestore.instance.collection('counter').doc('counter');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Adding Counter: $_addingCounter'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _addingCounter = Calculator().addOne(_addingCounter);
                });
              },
              child: const Text('Add one!'),
            ),
            const SizedBox(height: 16),
            Text('Subtracting Counter: $_subtractingCounter'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _subtractingCounter = Calculator().subtractOne(_subtractingCounter);
                });
              },
              child: const Text('Subtract one!'),
            ),
            const SizedBox(height: 16),
            StreamBuilder<int>(
              stream: _firestoreCounter,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text('Waiting...');
                }
                if (!snapshot.hasData) {
                  return const Text('Adding Counter (Firestore): 0');
                }
                final counter = snapshot.data!;
                return Text('Adding Counter (Firestore): $counter');
              },
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                await _counterRef.set(
                  <String, dynamic>{'counter': FieldValue.increment(1)},
                  SetOptions(merge: true),
                );
              },
              child: const Text('Add one!'),
            ),
          ],
        ),
      ),
    );
  }

  Stream<int> get _firestoreCounter {
    return _counterRef.snapshots().map((ds) {
      return (ds.data() ?? <String, dynamic>{'counter': 0})['counter'] as int;
    });
  }
}
