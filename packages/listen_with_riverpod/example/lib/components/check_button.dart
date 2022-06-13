import 'package:example_listen_with_riverpod/components/answer_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'problem_state.dart';

/// 答え合わせボタン
class CheckButton extends ConsumerWidget {
  const CheckButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final answer = ref.watch(answerProvider);
    return ElevatedButton(
      // 回答文字列を監視して、空欄の場合は非活性にする
      onPressed: answer.isNotEmpty
          ? () => ref.read(problemStateProvider.notifier).setAnswer(answer)
          : null,
      style: ElevatedButton.styleFrom(
        primary: Colors.green.shade700,
        padding: const EdgeInsets.symmetric(vertical: 16),
        textStyle: const TextStyle(
          fontSize: 24,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
      ),
      child: const Text('答え合わせ'),
    );
  }
}
