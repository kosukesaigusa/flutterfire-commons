# Riverpod の ref.listen のデモアプリ

[Riverpod の ref.listen](https://riverpod.dev/ja/docs/concepts/reading#reflisten-%E3%82%92%E4%BD%BF%E3%81%A3%E3%81%A6%E3%83%97%E3%83%AD%E3%83%90%E3%82%A4%E3%83%80%E3%82%92%E7%9B%A3%E8%A6%96%E3%81%99%E3%82%8B) を使ってプロバイダを監視するデモアプリです。
算数問題を題材にしました。

![デモ](https://user-images.githubusercontent.com/13707135/173295901-304e761a-02b9-42f2-afdf-97af7c5a4ad9.gif)

## デモアプリの中の使用例

### ① `ref.listen` を使ってダイアログを表示する

問題と回答を保持する問題状態（ `ProblemState` ）があり、問題状態を監視して回答済みなら結果をダイアログで表示する、ということを `ref.listen` を使って実現しています。

[problem_page.dart](example/lib/problem_page.dart)

```dart
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
```

### ② `ref.listen` を使って外部からの変更を Widget に反映する

次の問題に移ったときに回答用のテキストフィールドの文字列をクリアするのを、`ref.listen` を使って実現しています。

[components/answer_text_field.dart](example/lib/components/answer_text_field.dart)

```dart
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
```