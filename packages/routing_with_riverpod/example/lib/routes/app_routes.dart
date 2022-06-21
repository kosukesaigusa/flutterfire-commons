import 'package:example_routing_with_riverpod/routes/app_router_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../pages/not_found_page.dart';
import '../pages/repo_detail_page.dart';
import '../pages/repos_page.dart';
import 'app_route.dart';

/// go_router パッケージを一部参考にして簡易に実装した AppRoute インスタンスの一覧。
/// 各ページのコンストラクタに引数を渡さない済むように、そのような場合は ProviderScope.override で
/// appRouterStateProvider の値をオーバーライドして、各画面を AppState をオーバーライドされた
/// Provider 経由で取得するようにする。
final appRoutes = <AppRoute>[
  AppRoute(
    path: ReposPage.path,
    name: ReposPage.name,
    builder: (context, state) => const ReposPage(key: ValueKey(ReposPage.name)),
  ),
  AppRoute(
    path: RepoDetailPage.path,
    name: RepoDetailPage.name,
    // ここで appRouterStateProvider を override した ProviderScope を返すので、
    // その子の RepoDetailPage では、上書きされたパスパラメータや extra の値が使用できる。
    builder: (context, state) => ProviderScope(
      overrides: <Override>[appRouterStateProvider.overrideWithValue(state)],
      child: const RepoDetailPage(key: ValueKey(RepoDetailPage.name)),
    ),
  ),
  AppRoute(
    path: NotFoundPage.path,
    name: NotFoundPage.name,
    builder: (context, state) => const NotFoundPage(key: ValueKey(NotFoundPage.name)),
  ),
];
