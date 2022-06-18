import 'package:dio/dio.dart';

import '../../constants/string.dart';

/// ヘッダーに認証情報などを付加する
class HeaderInterceptor extends Interceptor {
  HeaderInterceptor([this.overwriteUrl]);

  String? overwriteUrl;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers[referrer] = overwriteUrl ?? options.baseUrl;
    options.headers['Origin'] = options.baseUrl;
    options.headers['Accept'] = 'application/vnd.github.v3+json';
    return handler.next(options);
  }
}
