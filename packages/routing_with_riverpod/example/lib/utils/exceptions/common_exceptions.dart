class RouteNotFoundException implements Exception {
  RouteNotFoundException(this.path);
  final String path;

  @override
  String toString() => '$path: 指定されたページが見つかりませんでした。';
}
