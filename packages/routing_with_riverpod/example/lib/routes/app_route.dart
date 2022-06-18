import '../utils/types.dart';

/// go_router パッケージの GoRoute クラスを参考にして
/// 簡略化したクラス。
class AppRoute {
  AppRoute({
    required this.path,
    required this.name,
    required this.builder,
  });

  /// ルートの名前
  final String name;

  /// ルートのパスパターン
  /// e.g. /family/:familyId/person/:personId
  final String path;

  /// ウィジェットビルダー
  final AppRouterWidgetBuilder builder;
}
