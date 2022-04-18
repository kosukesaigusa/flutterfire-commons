# 開発参加者の README

共同開発参加者のための環境構築とタスクの始め方をこの README にまとめます。

参加されたい方で、まだ申請が済んでいない方は

[参加フォーム](https://docs.google.com/forms/d/e/1FAIpQLSel5eF5Qvw-InhqmgPBP8gDLwiXRLJXtCMk1UF25QNujQHE2w/viewform)

への入力と送信をお願いします。確認し次第、この GitHub プロジェクトのコラボレータと Firebase プロジェクトへの招待を行います。

## 1. リポジトリを Clone する

自分のマシンの任意のディレクトリ（いつも使っている場所で構いません）に GitHub のリモートリポジトリを Clone してください。このドキュメントでは仮に、そのディレクトリを `~/workspace` とします。

例：

```shell
# gh コマンドの場合
gh repo clone KosukeSaigusa/flutterfire-commons

# HTTPS の場合
git clone https://github.com/KosukeSaigusa/flutterfire-commons.git
```

できない場合は権限設定に問題があるかもしれないので、Kosuke までご連絡してください。

## 2. melos を使ってプロジェクトを初期化する

このプロジェクトでは Dart 制 のモノレポ管理およびタスクランナー的に使用できる [melos](https://pub.dev/packages/melos) を使用します。

インストール方法や困ったことがあれば、

melos の pub.dev：

<https://pub.dev/packages/melos>

melos のドキュメント：

<https://melos.invertase.dev/>

を読むと解決できます。

自分のマシンのグローバルの Dart で使用できるようにするのが通例なので、まずは Dart コマンドのパスが通っていることを確認します。

```shell
which dart
# Dart のパスが通っていれば OK
```

Dart コマンドがグローバルに見つからない場合は、それぞれ好きな方法で設定してください。

問題なければ、melos の pub.dev に沿ってインストールします。

```shell
pub global activate melos
```

melos のパスも通っているか確認します。

```shell
which melos
# melos のパスが通っていれば OK
# 必要に応じて ~/.zshrc に
# export PATH="$PATH":"$HOME/.pub-cache/bin"
# などを追記してください
```

問題なければ、clone したプロジェクトルートに移動して、`melos bootstrap` コマンドを実行します。

```shell
cd ~/workspace/flutterfire-commons
melos bootstrap
```

下記のようなコンソール出力が現れれば OK です。

```shell
melos bootstrap
   └> /Users/kosukesaigusa/workspace/flutterfire-commons

Running "flutter pub get" in workspace packages...
  ✓ example_sample
    └> packages/sample/example
  ✓ example_utils
    └> packages/utils/example
  ✓ sample
    └> packages/sample
  ✓ utils
    └> packages/utils

Linking workspace packages...
  > SUCCESS

Generating IntelliJ IDE files...
  > SUCCESS

 -> 4 plugins bootstrapped
```

`melos bootstrap` コマンドについては、ここ：

<https://melos.invertase.dev/commands/bootstrap>

に説明があります。melos で構成されたモノレポプロジェクトの初期化の際に使用するコマンド、くらいの認識で大丈夫です。

`melos.yaml` に記述したタスクは、プロジェクト内のどこからでも `melos run タスク名` で実行することができ、

たとえば、次のような記述

```yaml
pub:get:
    run: melos exec -- "flutter pub get"
```

で登録されているタスクは、

```shell
melos run pub:get
```

で実行でき、`packages` ディレクトリのすべてで `flutter pub get` を実行してできます。

```.zsrhc
alias mr='melos run'
```

のようなエイリアスを設定していても良いかもしれません。

## 3. Flutter と Dart の SDK を設定する

このプロジェクトでは、最新の Flutter/Dart SDK バージョンを使用して開発を行っていきます。

2022-04-11 現在は

- Flutter: 2.10.4-stable
- Dart: 2.16.2

です。

これらが自身のマシンやこのプロジェクトで使用できるようにしてください。

asdf を使っている人は、すでにプロジェクトルートに `.too-versions` のファイルを配置しています。

asdf で Flutter の SDK バージョンを管理する方法は、この記事：

<https://zenn.dev/riscait/articles/asdf-flutter>

を参考にしてください。asdf でなくても、fvm や（混乱しなければ）マシンのグローバルで使用する Flutter SDK でも構いません。

また、皆さんの .vscode などのエディタの設定が異なることを考慮して、`.vscode/settings.json` は gitignore することにしています。代わりに、`.vscode/base_settings.json` で asdf を使用している人用の設定のサンプル、 `base_fvm_settings` でfvmを使用している人用の設定のサンプルはおいているので、

```shell
cd ~/workspace
cp .vscode/base_settings.json .vscode/settings.json
```

などとして、自身の VSCode の環境に適用されるようにしてください。

Android Studio の設定の説明は省きます。Android Studio をお使いの方で同等の設定ファイルが自動生成されたりする場合は、コミットに含めてもらえると、それ以降の Android Studio の方が助かるかもしれないのでお願いします。

## 4. タスクの始め方・進め方

### ブランチのこと

まずは main ブランチから派生した適当な名前の作業ブランチを作成しましょう。厳密なルールなどはないので `feature/タスクっぽい名前` で良いと思います。

```shell
git checkout main
git pull origin main
git checkout -b feature/your-task-name
```

### タスクを始める前にやること

新しいディレクトリを `packages` の下に作成する必要がある場合は、`packages/sample` を基本的にはまるごとコピーします。一部、README や LICENSE ファイルのシンボリックリンクが壊れる可能性があるので、 `scripts/create_package_template.sh` を実行するのが良いかもしれません。

```shell
cd ~/workspace/flutterfire-commons
sh ./scripts/create_package_template.sh
```

挙動がおかしかったりすれば教えてください、PR もください。

あとは、`sample` となっているファイル名やディレクトリ名、`example` 下の `pubspec.yaml` の `sample` の文字列などの自分の開発する内容に適宜置換してください。

### 開発する内容

自身が取り組む `packages/your-task-dir` ができたら、主に次の 3 つの開発を行います。必要に応じて `packages/sample` ディレクトリの内容と見比べながら理解してください。

1. `packages/your-task-dir/lib` に相談して決めた機能の開発を行う
2. `packages/your-task-dir/test` に 1 のユニットテストなどを書く
3. `packages/your-task-dir/example` に 1 の機能の典型的な使い方や受けられる恩恵がわかる、かんたんなサンプルアプリの開発を行う

1, 2, 3 のすべてを揃えて開発できるとすごいですが、1, 2 が難しいのでとりあえず 3 だけ！で PR にしてもらっても全然大丈夫です。

`packages/your-task-dir/example` のサンプルアプリをデバッグ起動する必要があると思うので、VSCode の方は（Android Studio の方も真似して書いてくださると大変ありがたいです）`.vscode/launch.json` に追記してください。

### Firebase プロジェクトとの接続

基本的には FlutterFire CLI を使った方法で行います。一部、たとえば Google サインインが関係するパッケージやサンプルアプリを使用する際には、FlutterFire CLI による接続だと正常に動作しないという情報もあるので、`google-services.json` や `GoogleService-Info.plist` を必要な場所に配置してください。Git の管理対象にしてしまって良いかなと思っています。

FlutterFire CLI で生成される設定ファイルは `packages/sample/` にすでに配置しており、同パッケージのサンプルアプリで接続できていることを確認しているので、上述の手順で正しくコピーできていればそのまま接続できるのではないかと思います。

### PR

開発する内容の 1, 2, 3 のうち、ある程度まとまったものができたら main ブランチに対して PR を作成してください。レビューしてやり取りをしてマージしていきます。ガンガン Contribute していきましょう！🎉
