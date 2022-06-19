import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_to_regexp/path_to_regexp.dart';
import 'package:tuple/tuple.dart';

import '../pages/not_found_page.dart';
import '../utils/exceptions/common_exceptions.dart';
import 'app_route.dart';
import 'app_router_state.dart';

final appRouterProvider = Provider.family<AppRouter, List<AppRoute>>(
  (_, appRoutes) => AppRouter(appRoutes),
);

class AppRouter {
  AppRouter(this.appRoutes);
  final List<AppRoute> appRoutes;
  final initialRoute = '/';

  /// MaterialApp や Navigator の onGenerateRoute に指定して使用する。
  Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    try {
      // routeSettings から、今回の遷移先に対応する AppRoute インスタンスと
      // AppRouteState インスタンスを抽出・作成する。
      final result = _analyzeRoute(routeSettings);
      final appRoute = result.item1;
      final appRouteState = result.item2;

      return MaterialPageRoute<dynamic>(
        settings: routeSettings,
        builder: (context) => appRoute.builder(
          context,
          appRouteState,
        ),
      );
    } on RouteNotFoundException {
      return MaterialPageRoute<void>(
        settings: routeSettings,
        builder: (context) => const NotFoundPage(),
      );
    }
  }

  /// パス、パスパラメータ、クエリパラメータの解析を行い、
  /// 対応する AppRoute と extra も含めて AppRouterState を返す。
  /// その 2 つのインスタンスをまとめて返したいだけで、Tuple であることに深い理由はない。
  /// それらまとめたクラスを定義しても良いかもしれないが、他で使用するわけでもないので Tuple にした。
  Tuple2<AppRoute, AppRouterState> _analyzeRoute(RouteSettings routeSettings) {
    final location = routeSettings.name ?? '';
    debugPrint('***');
    debugPrint('location: $location');

    // Object? のルート引数を extra とする。
    final extra = routeSettings.arguments;

    // location から path パターンとクエリパラメータを決定する。
    final analyzePathResult = _analyzePath(location);
    final path = analyzePathResult.item1;
    final queryParams = analyzePathResult.item2;

    // 今回の遷移先にマッチする AppRoute インスタンスを path_to_regexp パッケージの
    // pathToRegExp メソッドを用いて抽出する。
    // マッチするものがなければ RouteNotFoundException の例外をスローする
    final appRoute = appRoutes.firstWhere(
      (appRoute) => pathToRegExp(appRoute.path).matchAsPrefix(path) != null,
      orElse: () => throw RouteNotFoundException(path),
    );

    // パスパラメータを抽出する
    final parameters = <String>[];
    final match = pathToRegExp(appRoute.path, parameters: parameters).matchAsPrefix(path);
    final params = extract(parameters, match!);

    return Tuple2(
      appRoute,
      AppRouterState(
        location: location,
        name: appRoute.name,
        fullpath: appRoute.path,
        params: params,
        queryParams: queryParams,
        extra: extra,
      ),
    );
  }

  /// location から path パターン (String) とクエリパラメータ (Map<String, String>)を抽出して返す。
  /// その 2 つをまとめて返したいだけで、Tuple であることに深い理由はない。
  /// それらまとめたクラスを定義しても良いかもしれないが、他で使用するわけでもないので Tuple にした。
  Tuple2<String, Map<String, String>> _analyzePath(String location) {
    var path = location;
    var queryParams = <String, String>{};
    if (location.contains('?')) {
      queryParams = Uri.parse(location).queryParameters;
      path = location.split('?').first;
    }
    return Tuple2(path, queryParams);
  }
}
