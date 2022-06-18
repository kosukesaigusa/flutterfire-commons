import 'package:flutter/material.dart';

import '../routes/app_router_state.dart';

/// go_router パッケージの GoRouterWidgetBuilder タイプに対応する
/// Widget ビルダー関数の型定義。
typedef AppRouterWidgetBuilder = Widget Function(
  BuildContext context,
  AppRouterState state,
);
