import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widgets/widgets.dart';

void main() {
  testWidgets('App tracks lifecycle states', (tester) async {
    Future<void> setAppLifeCycleState(AppLifecycleState state) async {
      final message = const StringCodec().encodeMessage(state.toString());
      await ServicesBinding.instance?.defaultBinaryMessenger
          .handlePlatformMessage('flutter/lifecycle', message, (_) {});
    }

    await tester.pumpWidget(
      const MaterialApp(home: _LifeCycleTestWidget()),
    );

    expect(
      find.text('There are no AppLifecycleStates to show.'),
      findsOneWidget,
    );

    await setAppLifeCycleState(AppLifecycleState.resumed);
    await tester.pumpAndSettle();
    expect(find.text('state is: AppLifecycleState.resumed'), findsOneWidget);

    await setAppLifeCycleState(AppLifecycleState.inactive);
    await tester.pumpAndSettle();
    expect(find.text('state is: AppLifecycleState.inactive'), findsOneWidget);

    await setAppLifeCycleState(AppLifecycleState.paused);
    await tester.pumpAndSettle();
    await setAppLifeCycleState(AppLifecycleState.resumed);
    await tester.pumpAndSettle();
    expect(find.text('state is: AppLifecycleState.paused'), findsOneWidget);

    await setAppLifeCycleState(AppLifecycleState.detached);
    await tester.pumpAndSettle();
    await setAppLifeCycleState(AppLifecycleState.resumed);
    await tester.pumpAndSettle();
    expect(find.text('state is: AppLifecycleState.detached'), findsOneWidget);
  });
}

class _LifeCycleTestWidget extends StatefulWidget {
  const _LifeCycleTestWidget({Key? key}) : super(key: key);

  @override
  _LifeCycleTestWidgetState createState() => _LifeCycleTestWidgetState();
}

class _LifeCycleTestWidgetState extends State<_LifeCycleTestWidget> {
  final List<AppLifecycleState> _stateHistoryList = <AppLifecycleState>[];

  @override
  Widget build(BuildContext context) {
    return LifeCycle(
      onResumed: () => setState(() {
        _stateHistoryList.add(AppLifecycleState.resumed);
      }),
      onInactive: () => setState(() {
        _stateHistoryList.add(AppLifecycleState.inactive);
      }),
      onPaused: () => setState(() {
        _stateHistoryList.add(AppLifecycleState.paused);
      }),
      onDetached: () => setState(() {
        _stateHistoryList.add(AppLifecycleState.detached);
      }),
      child: _stateHistoryList.isEmpty
          ? const Center(
              child: Text('There are no AppLifecycleStates to show.'),
            )
          : ListView.builder(
              key: const ValueKey<String>('stateHistoryList'),
              itemCount: _stateHistoryList.length,
              itemBuilder: (context, index) {
                return Text('state is: ${_stateHistoryList[index]}');
              },
            ),
    );
  }
}
