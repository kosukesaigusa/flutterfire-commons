import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotFoundPage extends HookConsumerWidget {
  const NotFoundPage({super.key});
  static const path = '/not-found';
  static const name = 'NotFoundPage';
  static const location = path;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text('ページが見つかりませんでした。'),
                const Gap(48),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('戻る'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
