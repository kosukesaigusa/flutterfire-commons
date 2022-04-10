---
theme: default
background: https://source.unsplash.com/collection/94734566/1920x1080
class: 'text-center'
highlighter: shiki
info: |
  ## Slidev Starter Template
  Presentation slides for developers.

  Learn more at [Sli.dev](https://sli.dev)
fonts:
  sans: 'Roboto'
  serif: 'Roboto'
  mono: 'Fira Code'
---

# 共同開発第8弾<br>flutterfire-commons の開発

2022-04-10 (水) Kosuke

Flutter 大学 共同開発キックオフ

---

## Flutter, FlutterFire が大好きな皆さん

皆さん Flutter, FlutterFire でのアプリケーション開発は好きですか？

好きな理由はなんですか？

- **開発者体験**がすごく良い
- マルチプラットフォームのアプリを**高効率**に開発できる
- Flutter/Dart の SDK や各種パッケージの進化や**盛り上がりを続けるコミュニティ**に身を置ける
- 奇を衒わず書きやすい **Dart も愛らしい**
- 工夫して使いこなせば**結構なんでもできる** Firebase

> 💙🔥 FlutterFire commons repository, makes FlutterFire app development faster, easier, and more fun!

をテーマに「アプリを作らない共同開発プロジェクト」として、**"flutterfire-commons"** という OSS リポジトリの開発を行います。

---

## 誰

- Kosuke Saigusa
- 本業は株式会社 TORICO で **Flutter エンジニア**（Django/Python, Nuxt.js/Vue.js/TypeScript, MySQL, ほんのちょっと PHP なども）をしています
- 個人開発などでは **FlutterFire** で開発するのが大好き、Flutter 以外にも **Firebase への興味も強め**です
- Flutter 大学では毎週水曜日の共同勉強会の発案と幹事、土曜日の質問 Zoom の講師をしています

<img src="/profile-resized.jpg" class="h-48 rounded-xl" />

---

## 何 (1)

[**flutterfire-commons**](https://github.com/KosukeSaigusa/flutterfire-commons) という OSS リポジトリの開発を行います。

App Store や Google Play Store でアプリをリリースする代わりに、GitHub のパブリックリポジトリに、FlutterFire の開発者が pubspec.yaml に記述・使用して便利な機能や、サンプルプロジェクトをたくさん含んだ大きなモノレポの開発を行います。構成ややりたいことは [flutter_use](https://pub.dev/packages/flutter_use) に少し似ています。

開発する内容は**皆で相談しながら、自由に、雑多にいろいろ**やります。

開発が進み、まとまった機能ができたらそれらを選択・抽出して、共同開発期間の後にでも皆で一緒に pub.dev にパッケージを公開しても良いなと思っています。

---

## 何 (2)

思いつくのは無数にありますが例えば...

- `int: 1000` を入力したら `string: "1,000"` が返ってくる `addComma()` 的なメソッド
- `DateTime` 型を入力したら `string: "2022-04-10 (日)"` とか `string: "2022-04-10 (日)"` とか `string: "2時間前"` とか `string: "3日前"` とかの良い感じに日時の文字列を返してくれる `humanReadableDateTime()` 的なメソッドとそのテスト
- いろいろな状態管理手法で行うカウンターアプリのサンプルが複数含まれたプロジェクト
- Firestore のドキュメントを無限スクロールで読み込むサンプル、あわよくばコレクションレファレンスとジェネリクスで型を指定すると誰でも使えるそのような `ListView` 的なウィジェットの開発
- 万人が使える Dart の Firestore のドキュメント・コレクションの取得・購読を型安全に行うための Repository クラス的なもののスニペット
- Cloud Functions で使用できるそれに対応する TypeScript の interface やコンバータのスニペット
- http か Dio をラップして、デバッグ用に対応する curl コマンドをコンソールに出力したりできる API クライアントの抽象クラス・実装クラス・モック用クラスの実装
- 実践的なウィジェットテストを含むサンプルプロジェクト
- ...

---

## いつ・どこ

- 曜日や時間を定めて、開発内容の選定や割り振りを行うミーティングを **Zoom や Gather** などで行います
- Slack の [**共同開発8_flutterfire-commons**](https://flutteruniv.slack.com/archives/C03B89SMV6U) チャンネルに、開発に参加する方も、様子を見たい方も自由にお集まりください！
- 開発への参加を希望する方は、GitHub や各種サービスへの招待をするための[**参加申請フォーム**](forms.gle/pyn8LWQmnjZ9Jmc67)の入力・提出をお願いします（上記のチャンネルにもリンクを貼っています、いまこの時間からご自由なタイミングでご提出ください！）

---

## どのように

- まずは最初の何回かのミーティングで、直近で開発したい内容をある程度決めていきます。その後やりたい内容を参加者で分担します
- **GitHub の Issue と Project カンバン**上でタスク管理・割り振りをして進めます
- 開発担当は基本的にモノレポ内のリポジトリごとなので、**開発分担は容易で明確**なつもりです。他の開発者との兼ね合いやプロジェクト全体の進行具合で困ることはなく、マイペースでできます。仕様の詰めや技術的・実装上の困りごとは私もいつでも相談に乗ります
- **皆で楽しくレビューしあって、少しずつリポジトリを育てていきます**。かっちり実装したい人はそれでも、まだ不安がある人も、以前のコードよりも前進していたらマージ！くらいの認識で開発に加わってもらっても大丈夫なのでご安心ください🙆‍♂️

---

## なぜ

プロジェクトの目的は

> 💙🔥 FlutterFire commons repository, makes FlutterFire app development faster, easier, and more fun!

をテーマとして OSS リポジトリの開発を参加者皆で楽しく行うことです。まずは皆さん自身が個人開発のプロジェクトなどで pubspec.yaml に書いて使用したいな、と思える機能が少しでもできれば良いと思っています。

**皆さんが参加するモチベーションやメリット**は次のような感じでしょうか！

- 上記のテーマに共感すること
- 開発してみたい機能があること
- これを機に今までの Flutter, Firebase の知識や経験を整理して公開すること、まだやったことないこと・知らないことに取り組んでみること
- イシュー・プロジェクト内のリポジトリ単位で開発を担当するので、アプリを丸ごと作る共同開発よりはライトにマイペースに取り組める側面もあるかも
- 共同開発を通じて色々学びたい・吸収したい
- 共同開発参加を通じて PR レビューや技術相談に乗って欲しい

---

## さいごに

- 開発参加者も、覗き見の方も、Slack の [**共同開発8_flutterfire-commons**](https://flutteruniv.slack.com/archives/C03B89SMV6U) チャンネルにご参加ください！
- 私以外に数人程度、開発内容・方針の相談やプロジェクトの進行をリードする役割を一緒にやってくる方も募集します！時々技術的な相談をさせてもらったり、主な PR レビューの担当者になったりするイメージです。フォームにチェックボックス欄があるのでお願いします ✅
