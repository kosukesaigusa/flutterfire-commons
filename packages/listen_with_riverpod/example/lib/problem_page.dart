import 'package:example_listen_with_riverpod/components/check_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/answer_text_field.dart';
import 'components/problem_sentence.dart';
import 'components/problem_state.dart';
import 'components/result_dialog.dart';

/// 算数問題画面
class ProblemPage extends ConsumerWidget {
  const ProblemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 問題状態を監視して、回答済みなら結果ダイアログを表示する
    ref.listen<ProblemState>(
      problemStateProvider,
      (previous, next) {
        if (next.status != ProblemStatus.questioning) {
          showDialog<void>(
            context: context,
            builder: (context) => ResultDialog(
              status: next.status,
            ),
          );
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('算数問題'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            SizedBox(height: 16),
            ProblemSentence(),
            SizedBox(height: 16),
            AnswerTextField(),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: CheckButton(),
            ),
          ],
        ),
      ),
    );
  }
}
