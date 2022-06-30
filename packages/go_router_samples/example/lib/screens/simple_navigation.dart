import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// サブルートへの遷移、引数を渡す遷移のサンプル
///
class SimpleNavigationScreen extends ConsumerWidget {
  const SimpleNavigationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final randomNums = createRandomNums();

    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Simple Navigation'),
        ),
        body: SafeArea(
          child: Center(
            child: Stack(
              children: <Widget>[
                ListView(
                  children: <Widget>[
                    ...randomNums
                        .map(
                          (id) => NavigationContainer(id: id),
                        )
                        .toList()
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16, bottom: 64),
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        // サブルートへの遷移
                        context.go('/simple/login');
                      },
                      label: const Text(
                        'Login',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<int> createRandomNums() {
    final result = <int>[];
    final rdm = Random();
    for (var i = 0; i < 10; i++) {
      result.add(rdm.nextInt(1000));
    }
    return result;
  }
}

class NavigationContainer extends StatelessWidget {
  const NavigationContainer({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // 引数を渡す遷移
        context.go('/simple/number/$id');
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        height: 120,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            '$id',
            style: const TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
