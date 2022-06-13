import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'problem_state.freezed.dart';

/// 問題状態プロバイダー
final problemStateProvider =
    StateNotifierProvider.autoDispose<ProblemStateNotifier, ProblemState>(
  (ref) => ProblemStateNotifier(),
);

/// 問題状態
@freezed
class ProblemState with _$ProblemState {
  const factory ProblemState({
    @Default(<int>[]) List<int> numbers,
    String? answer,
  }) = _ProblemState;

  /// 問題を新規に生成する
  factory ProblemState.generate() => ProblemState(
        numbers: List<int>.generate(2, (i) => Random().nextInt(10)),
      );
}

extension ProblemStateHelper on ProblemState {
  /// 問題文を返す
  String get sentence {
    final sb = StringBuffer();
    numbers.asMap().forEach(
        (i, n) => sb.write(i == numbers.length - 1 ? '$n =' : '$n + '));
    return sb.toString();
  }

  /// 正解を返す
  int get correctNumber => numbers.reduce((a, b) => a + b);

  /// 問題ステータスを返す
  ProblemStatus get status {
    final answerString = answer;
    if (answerString == null) {
      return ProblemStatus.questioning;
    }

    try {
      final answerInt = int.tryParse(answerString);
      return answerInt == null
          ? ProblemStatus.formatError
          : answerInt != correctNumber
              ? ProblemStatus.incorrect
              : ProblemStatus.correct;
    } on FormatException catch (_) {
      return ProblemStatus.formatError;
    }
  }
}

/// 問題ステータス
enum ProblemStatus {
  /// 出題中
  questioning,

  /// 正解
  correct,

  /// 不正解
  incorrect,

  /// フォーマットエラー
  formatError,
}

/// 質問状態コントローラー
class ProblemStateNotifier extends StateNotifier<ProblemState> {
  ProblemStateNotifier() : super(ProblemState.generate());

  /// 答えを設定する
  void setAnswer(String answer) {
    state = state.copyWith(answer: answer);
  }
}
