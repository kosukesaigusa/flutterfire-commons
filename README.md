# GoRouterを使ったBottomNavigationBar永続化のサンプル
*※ こちらはNavigator1.0とNavigator2.0を併用させたアプローチになります*
## アプローチ
1. `GoRouter`クラスの`navigationBuilder`を活用
2. `Navigator`クラスでラップした`BottomNavigationBar`をメインのページスタックの上に表示
3. タブでの画面遷移に見える様、ページ遷移時のアニメーションを調整

navigationBuilderパラメータではメインのページスタックの上にWidgetを重ねる事が出来ます。
https://gorouter.dev/navigator-builder

こちらを活用し、`BottomNavigationBar`を全てのページスタックの上に重ねて表示しています。

`BottomNavigationBar`は`MaterialPage`配下に配置されている必要がある為、`Navigator`クラスでラップする必要があります。

肝となるのはGoRouterの以下部分です。
```dart
  GoRouter(
    ...,
    navigatorBuilder: (context, state, child) {
      return Navigator(
        onPopPage: (route, dynamic __) => false,
        pages: [
          MaterialPage<Widget>(
            child: BottomNav(
              child: child,
            ),
          ),
        ],
      );
    },
  )
```

またタブでの画面遷移に見える様、トップレベルのページのみ遷移時のアニメーションを調整しています。
https://gorouter.dev/transitions

```dart
  GoRoute(
    name: 'simple',
    path: '/simple',
    pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const SimpleNavigationScreen(),
        transitionDuration: Duration.zero, // <= Duration.zeroで遷移する様、調整
        transitionsBuilder:
            (context, animation, secondaryAnimation, child) => child),
```


# ページ別動作のサンプル
BottomNavigationBarの各タブではそれぞれ異なる画面遷移のサンプルを用意しました。

## Simple Navigation Screen
画像

サブルートへの画面遷移
https://gorouter.dev/sub-routes

```dart
  GoRoute(
    name: 'simple',
    ...,
    routes: [ // routes内に定義する事でsub-routeを繋げる
      GoRoute( 
        name: 'login',
        path: 'login',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const LoginScreen(),
        ),
      ),
      ...,
    ],
  ),
```

引数を渡した画面遷移
https://gorouter.dev/parameters

```dart
  GoRoute(
    name: 'simple',
    ...,
    routes: [
      ...,
      GoRoute(
        name: 'number',
        path: 'number/:id', // 引数を含むパスを定義
        builder: (context, state) {
          final id = state.params['id']!; // stateから引数を取り出す
          return NumberScreen(number: id);
        },
      ),
    ],
  ),
```
引数を含むパスで遷移
```dart
onTap: () => context.go('/simple/number/$id');
```

## Overlay Navigation Screen
画像

DialogやModalBottomSheetの挙動のサンプルです。

DialogやModalBottomSheetはGoRouterで定義されたページスタックではなく、`navigatorBuilder`内に定義された`Navigator`クラス上に被さります

その為、これらをクローズする場合は`GoRouter.of(context).pop()`ではなく、`Navigator.of(context).pop()`を使います

```dart
  await showDialog<void>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('This is the Dialog'),
        content: const Text('This is the content'),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(), // Navigatorのpopを使用
          ),
          TextButton(
            child: const Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      );
    },
  );
```

また`showModalBottomSheet`では`useRootNavigator`パラメータを使う事で、`Navigator`クラスの上に被せるか、`GoRouter`クラスの上に被せるかを操作出来ます

```dart
  await showModalBottomSheet<bool>(
    context: context,
    // trueでNavigatorの上、デフォルトのfalseでGoRouterの上に表示
    useRootNavigator: true, 
    builder: (context) {
      ...
    },
  );
```

## TabBar Navigation Screen
画像

`BottomNavigationBar`と`TabBar`を併用した挙動のサンプルです。

`TabBarView`内からネストした画面へも問題なく遷移出来ます

# 問題点
## ・ブラウザバックに非対応
本アプローチでは`BottomNavigationBar`の選択中インデックスをアイコンをタップする事で変更しています。

その為、Webのブラウザバックに対し、選択中インデックスの更新がされません。

# Navigator2.0だけでの対応

本アプローチはNavigator1.0とNavigator2.0を併用したアプローチになります。

Navigator1.0と2.0の併用については公式ドキュメントでも「併用可」とする記述がある為、問題はないと思いますが、可能であれば一本化したい所。
https://stackoverflow.com/a/68579883/18124943

ですが現状、Nabigator2.0のみで`TabBar`や`BottomNavigationBar`の永続化は行えません。

ただ以下の通り、対応について度々議論されている為、将来的に対応される可能性は十分ありそうです。

https://github.com/csells/go_router/issues/133
https://github.com/csells/go_router/discussions/222