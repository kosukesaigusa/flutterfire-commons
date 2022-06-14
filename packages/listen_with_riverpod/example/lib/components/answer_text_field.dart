import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'problem_state.dart';

/// 回答文字列プロバイダー
final answerProvider = StateProvider.autoDispose<String>(
  (ref) => '',
);

/// 回答テキストフィールド
class AnswerTextField extends ConsumerStatefulWidget {
  const AnswerTextField({Key? key}) : super(key: key);

  @override
  ConsumerState<AnswerTextField> createState() => _AnswerTextFieldState();
}

class _AnswerTextFieldState extends ConsumerState<AnswerTextField> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // 回答文字列プロバイダーを監視して、外部から回答文字列が変更されたら
    // テキストフィールドの文字列にも反映する
    ref.listen<String>(
      answerProvider,
      (previous, next) {
        // 同じ文字列なのに設定し直すとカーソル位置が変わるので
        // 文字列が変わったときだけ更新する
        if (_controller.text != next) {
          _controller.text = next;
        }
      },
    );

    return TextField(
      controller: _controller,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: '答え',
      ),
      keyboardType: TextInputType.number,
      style: Theme.of(context).textTheme.headline5,
      autofocus: true,
      // 回答文字列プロバイダーを都度更新する
      onChanged: (text) => ref.read(answerProvider.notifier).state = text,
      // キーボードの完了ボタン押下で回答を設定する
      onSubmitted: (text) {
        if (text.isNotEmpty) {
          ref.read(problemStateProvider.notifier).setAnswer(text);
        }
      },
    );
  }
}
