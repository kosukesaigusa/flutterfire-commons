import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

Future<void> main() async {
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

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  String currentAppLifeCycleStateString = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LifeCycle(
      onInactive: () {
        setState(() {
          debugPrint('state is inactive');
          currentAppLifeCycleStateString = 'inactive';
        });
      },
      onResumed: () {
        setState(() {
          debugPrint('state is resumed');
          currentAppLifeCycleStateString = 'resumed';
        });
      },
      onPaused: () {
        setState(() {
          debugPrint('state is paused');
          currentAppLifeCycleStateString = 'paused';
        });
      },
      onDetached: () {
        setState(() {
          debugPrint('state is detached');
          currentAppLifeCycleStateString = 'detached';
        });
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text('CurrentState: $currentAppLifeCycleStateString'),
        ),
      ),
    );
  }
}
