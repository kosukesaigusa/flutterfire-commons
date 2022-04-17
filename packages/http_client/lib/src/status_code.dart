// ignore_for_file: constant_identifier_names

enum StatusCode {
  Continue,
  SwitchingProtocols,
  Processing,
  OK,
  Created,
  Accepted,
  NonAuthoritativeInformation,
  NoContent,
  ResetContent,
  PartialContent,
  MultiStatus,
  AlreadyReported,
  ImUsed,
  MultipleChoices,
  MovedPermanently,
  Found,
  SeeOther,
  NotModified,
  UseProxy,
  TemporaryRedirect,
  PermanentRedirect,
  BadRequest,
  Unauthorized,
  PaymentRequired,
  Forbidden,
  NotFound,
  MethodNotAllowed,
  NotAcceptable,
  ProxyAuthenticationRequired,
  RequestTimeout,
  Conflict,
  Gone,
  LengthRequired,
  PreconditionFailed,
  PayloadTooLarge,
  URITooLong,
  UnsupportedMediaType,
  RangeNotSatisfiable,
  ExpectationFailed,
  UnprocessableEntity,
  Locked,
  FailedDependency,
  UpgradeRequired,
  PreconditionRequired,
  TooManyRequests,
  RequestHeaderFieldsTooLarge,
  InternalServerError,
  NotImplemented,
  BadGateway,
  ServiceUnavailable,
  GatewayTimeout,
  HTTPVersionNotSupported,
  VariantAlsoNegotiates,
  InsufficientStorage,
  LoopDetected,
  NotExtended,
  NetworkAuthenticationRequired,
  Unknown,
}

extension StatusCodeExtension on StatusCode {
  int get code {
    switch (this) {
      case StatusCode.Continue:
        return 100;
      case StatusCode.SwitchingProtocols:
        return 101;
      case StatusCode.Processing:
        return 102;
      case StatusCode.OK:
        return 200;
      case StatusCode.Created:
        return 201;
      case StatusCode.Accepted:
        return 202;
      case StatusCode.NonAuthoritativeInformation:
        return 203;
      case StatusCode.NoContent:
        return 204;
      case StatusCode.ResetContent:
        return 205;
      case StatusCode.PartialContent:
        return 206;
      case StatusCode.MultiStatus:
        return 207;
      case StatusCode.AlreadyReported:
        return 208;
      case StatusCode.ImUsed:
        return 226;
      case StatusCode.MultipleChoices:
        return 300;
      case StatusCode.MovedPermanently:
        return 301;
      case StatusCode.Found:
        return 302;
      case StatusCode.SeeOther:
        return 303;
      case StatusCode.NotModified:
        return 304;
      case StatusCode.UseProxy:
        return 305;
      case StatusCode.TemporaryRedirect:
        return 307;
      case StatusCode.PermanentRedirect:
        return 308;
      case StatusCode.BadRequest:
        return 400;
      case StatusCode.Unauthorized:
        return 401;
      case StatusCode.PaymentRequired:
        return 402;
      case StatusCode.Forbidden:
        return 403;
      case StatusCode.NotFound:
        return 404;
      case StatusCode.MethodNotAllowed:
        return 405;
      case StatusCode.NotAcceptable:
        return 406;
      case StatusCode.ProxyAuthenticationRequired:
        return 407;
      case StatusCode.RequestTimeout:
        return 408;
      case StatusCode.Conflict:
        return 409;
      case StatusCode.Gone:
        return 410;
      case StatusCode.LengthRequired:
        return 411;
      case StatusCode.PreconditionFailed:
        return 412;
      case StatusCode.PayloadTooLarge:
        return 413;
      case StatusCode.URITooLong:
        return 414;
      case StatusCode.UnsupportedMediaType:
        return 415;
      case StatusCode.RangeNotSatisfiable:
        return 416;
      case StatusCode.ExpectationFailed:
        return 417;
      case StatusCode.UnprocessableEntity:
        return 422;
      case StatusCode.Locked:
        return 423;
      case StatusCode.FailedDependency:
        return 424;
      case StatusCode.UpgradeRequired:
        return 426;
      case StatusCode.PreconditionRequired:
        return 428;
      case StatusCode.TooManyRequests:
        return 429;
      case StatusCode.RequestHeaderFieldsTooLarge:
        return 431;
      case StatusCode.InternalServerError:
        return 500;
      case StatusCode.NotImplemented:
        return 501;
      case StatusCode.BadGateway:
        return 502;
      case StatusCode.ServiceUnavailable:
        return 503;
      case StatusCode.GatewayTimeout:
        return 504;
      case StatusCode.HTTPVersionNotSupported:
        return 505;
      case StatusCode.VariantAlsoNegotiates:
        return 506;
      case StatusCode.InsufficientStorage:
        return 507;
      case StatusCode.LoopDetected:
        return 508;
      case StatusCode.NotExtended:
        return 510;
      case StatusCode.NetworkAuthenticationRequired:
        return 511;
      case StatusCode.Unknown:
        return 0;
    }
  }

  String get message {
    switch (this) {
      case StatusCode.Continue:
        return 'Continue';
      case StatusCode.SwitchingProtocols:
        return 'Switching Protocols';
      case StatusCode.Processing:
        return 'Processing';
      case StatusCode.OK:
        return 'OK';
      case StatusCode.Created:
        return 'Created';
      case StatusCode.Accepted:
        return 'Accepted';
      case StatusCode.NonAuthoritativeInformation:
        return 'Non-Authoritative Information';
      case StatusCode.NoContent:
        return 'No Content';
      case StatusCode.ResetContent:
        return 'Reset Content';
      case StatusCode.PartialContent:
        return 'Partial Content';
      case StatusCode.MultiStatus:
        return 'Multi-Status';
      case StatusCode.AlreadyReported:
        return 'Already Reported';
      case StatusCode.ImUsed:
        return 'IM Used';
      case StatusCode.MultipleChoices:
        return 'Multiple Choices';
      case StatusCode.MovedPermanently:
        return 'Moved Permanently';
      case StatusCode.Found:
        return 'Found';
      case StatusCode.SeeOther:
        return 'See Other';
      case StatusCode.NotModified:
        return 'Not Modified';
      case StatusCode.UseProxy:
        return 'Use Proxy';
      case StatusCode.TemporaryRedirect:
        return 'Temporary Redirect';
      case StatusCode.PermanentRedirect:
        return 'Permanent Redirect';
      case StatusCode.BadRequest:
        return 'Bad Request';
      case StatusCode.Unauthorized:
        return 'Unauthorized';
      case StatusCode.PaymentRequired:
        return 'Payment Required';
      case StatusCode.Forbidden:
        return 'Forbidden';
      case StatusCode.NotFound:
        return 'Not Found';
      case StatusCode.MethodNotAllowed:
        return 'Method Not Allowed';
      case StatusCode.NotAcceptable:
        return 'Not Acceptable';
      case StatusCode.ProxyAuthenticationRequired:
        return 'Proxy Authentication Required';
      case StatusCode.RequestTimeout:
        return 'Request Timeout';
      case StatusCode.Conflict:
        return 'Conflict';
      case StatusCode.Gone:
        return 'Gone';
      case StatusCode.LengthRequired:
        return 'Length Required';
      case StatusCode.PreconditionFailed:
        return 'Precondition Failed';
      case StatusCode.PayloadTooLarge:
        return 'Payload Too Large';
      case StatusCode.URITooLong:
        return 'URI Too Long';
      case StatusCode.UnsupportedMediaType:
        return 'Unsupported Media Type';
      case StatusCode.RangeNotSatisfiable:
        return 'Range Not Satisfiable';
      case StatusCode.ExpectationFailed:
        return 'Expectation Failed';
      case StatusCode.UnprocessableEntity:
        return 'Unprocessable Entity';
      case StatusCode.Locked:
        return 'Locked';
      case StatusCode.FailedDependency:
        return 'Failed Dependency';
      case StatusCode.UpgradeRequired:
        return 'Upgrade Required';
      case StatusCode.PreconditionRequired:
        return 'Precondition Required';
      case StatusCode.TooManyRequests:
        return 'Too Many Requests';
      case StatusCode.RequestHeaderFieldsTooLarge:
        return 'Request Header Fields Too Large';
      case StatusCode.InternalServerError:
        return 'Internal Server Error';
      case StatusCode.NotImplemented:
        return 'Not Implemented';
      case StatusCode.BadGateway:
        return 'Bad Gateway';
      case StatusCode.ServiceUnavailable:
        return 'Service Unavailable';
      case StatusCode.GatewayTimeout:
        return 'Gateway Timeout';
      case StatusCode.HTTPVersionNotSupported:
        return 'HTTP Version Not Supported';
      case StatusCode.VariantAlsoNegotiates:
        return 'Variant Also Negotiates';
      case StatusCode.InsufficientStorage:
        return 'Insufficient Storage';
      case StatusCode.LoopDetected:
        return 'Loop Detected';
      case StatusCode.NotExtended:
        return 'Not Extended';
      case StatusCode.NetworkAuthenticationRequired:
        return 'Network Authentication Required';
      case StatusCode.Unknown:
        return 'Unknown';
    }
  }

  String get messageInJP {
    switch (this) {
      case StatusCode.Continue:
        return '継続';
      case StatusCode.SwitchingProtocols:
        return 'プロトコルの切り替え';
      case StatusCode.Processing:
        return '処理中';
      case StatusCode.OK:
        return 'OK';
      case StatusCode.Created:
        return '作成';
      case StatusCode.Accepted:
        return '受理';
      case StatusCode.NonAuthoritativeInformation:
        return '信頼できない情報です';
      case StatusCode.NoContent:
        return '内容がありません';
      case StatusCode.ResetContent:
        return 'コンテンツのリセット';
      case StatusCode.PartialContent:
        return '部分的なコンテンツ';
      case StatusCode.MultiStatus:
        return 'マルチステータス';
      case StatusCode.AlreadyReported:
        return 'すでに報告されています';
      case StatusCode.ImUsed:
        return 'IM Used';
      case StatusCode.MultipleChoices:
        return '複数の選択肢';
      case StatusCode.MovedPermanently:
        return '永久に移動されました';
      case StatusCode.Found:
        return '見つかりました';
      case StatusCode.SeeOther:
        return 'その他を参照';
      case StatusCode.NotModified:
        return 'Not Modified';
      case StatusCode.UseProxy:
        return 'Use Proxy';
      case StatusCode.TemporaryRedirect:
        return '一時的なリダイレクト';
      case StatusCode.PermanentRedirect:
        return '恒久的なリダイレクト';
      case StatusCode.BadRequest:
        return '不正なリクエスト';
      case StatusCode.Unauthorized:
        return '認証エラー';
      case StatusCode.PaymentRequired:
        return '支払いが必要です';
      case StatusCode.Forbidden:
        return '許可されていません';
      case StatusCode.NotFound:
        return '見つかりませんでした';
      case StatusCode.MethodNotAllowed:
        return 'メソッドは許可されていません';
      case StatusCode.NotAcceptable:
        return '受け入れ不可';
      case StatusCode.ProxyAuthenticationRequired:
        return 'プロキシ認証が必要です';
      case StatusCode.RequestTimeout:
        return 'リクエストタイムアウト';
      case StatusCode.Conflict:
        return 'コンフリクト';
      case StatusCode.Gone:
        return '過ぎています';
      case StatusCode.LengthRequired:
        return '長さが必要です';
      case StatusCode.PreconditionFailed:
        return '事前条件失敗';
      case StatusCode.PayloadTooLarge:
        return 'ペイロードが大きすぎます';
      case StatusCode.URITooLong:
        return 'URIが長すぎます';
      case StatusCode.UnsupportedMediaType:
        return '未対応のメディアタイプ';
      case StatusCode.RangeNotSatisfiable:
        return '範囲を満たしていません';
      case StatusCode.ExpectationFailed:
        return '期待された値が設定されていません';
      case StatusCode.UnprocessableEntity:
        return '処理不能なエンティティ';
      case StatusCode.Locked:
        return 'ロックされました';
      case StatusCode.FailedDependency:
        return '依存関係に失敗しました';
      case StatusCode.UpgradeRequired:
        return 'アップグレードが必要です';
      case StatusCode.PreconditionRequired:
        return '前提条件が必要です';
      case StatusCode.TooManyRequests:
        return '要求が多すぎます';
      case StatusCode.RequestHeaderFieldsTooLarge:
        return 'リクエストヘッダーフィールドが大きすぎます';
      case StatusCode.InternalServerError:
        return '内部サーバーエラー';
      case StatusCode.NotImplemented:
        return '未実装';
      case StatusCode.BadGateway:
        return '不正なゲートウェイ';
      case StatusCode.ServiceUnavailable:
        return 'サービス不能';
      case StatusCode.GatewayTimeout:
        return 'ゲートウェイタイムアウト';
      case StatusCode.HTTPVersionNotSupported:
        return 'HTTPバージョンはサポートされていません';
      case StatusCode.VariantAlsoNegotiates:
        return 'Variant Also Negotiates';
      case StatusCode.InsufficientStorage:
        return 'Insufficient Storage';
      case StatusCode.LoopDetected:
        return 'ループが検出されました';
      case StatusCode.NotExtended:
        return 'Not Extended';
      case StatusCode.NetworkAuthenticationRequired:
        return 'ネットワーク認証が必要です';
      case StatusCode.Unknown:
        return '原因不明';
    }
  }
}

StatusCode getStatusCode({required int statusCode}) {
  switch (statusCode) {
    case 100:
      return StatusCode.Continue;
    case 101:
      return StatusCode.SwitchingProtocols;
    case 102:
      return StatusCode.Processing;
    case 200:
      return StatusCode.OK;
    case 201:
      return StatusCode.Created;
    case 202:
      return StatusCode.Accepted;
    case 203:
      return StatusCode.NonAuthoritativeInformation;
    case 204:
      return StatusCode.NoContent;
    case 205:
      return StatusCode.ResetContent;
    case 206:
      return StatusCode.PartialContent;
    case 207:
      return StatusCode.MultiStatus;
    case 208:
      return StatusCode.AlreadyReported;
    case 226:
      return StatusCode.ImUsed;
    case 300:
      return StatusCode.MultipleChoices;
    case 301:
      return StatusCode.MovedPermanently;
    case 302:
      return StatusCode.Found;
    case 303:
      return StatusCode.SeeOther;
    case 304:
      return StatusCode.NotModified;
    case 305:
      return StatusCode.UseProxy;
    case 307:
      return StatusCode.TemporaryRedirect;
    case 308:
      return StatusCode.PermanentRedirect;
    case 400:
      return StatusCode.BadRequest;
    case 401:
      return StatusCode.Unauthorized;
    case 402:
      return StatusCode.PaymentRequired;
    case 403:
      return StatusCode.Forbidden;
    case 404:
      return StatusCode.NotFound;
    case 405:
      return StatusCode.MethodNotAllowed;
    case 406:
      return StatusCode.NotAcceptable;
    case 407:
      return StatusCode.ProxyAuthenticationRequired;
    case 408:
      return StatusCode.RequestTimeout;
    case 409:
      return StatusCode.Conflict;
    case 410:
      return StatusCode.Gone;
    case 411:
      return StatusCode.LengthRequired;
    case 412:
      return StatusCode.PreconditionFailed;
    case 413:
      return StatusCode.PayloadTooLarge;
    case 414:
      return StatusCode.URITooLong;
    case 415:
      return StatusCode.UnsupportedMediaType;
    case 416:
      return StatusCode.RangeNotSatisfiable;
    case 417:
      return StatusCode.ExpectationFailed;
    case 422:
      return StatusCode.UnprocessableEntity;
    case 423:
      return StatusCode.Locked;
    case 424:
      return StatusCode.FailedDependency;
    case 426:
      return StatusCode.UpgradeRequired;
    case 428:
      return StatusCode.PreconditionRequired;
    case 429:
      return StatusCode.TooManyRequests;
    case 431:
      return StatusCode.RequestHeaderFieldsTooLarge;
    case 500:
      return StatusCode.InternalServerError;
    case 501:
      return StatusCode.NotImplemented;
    case 502:
      return StatusCode.BadGateway;
    case 503:
      return StatusCode.ServiceUnavailable;
    case 504:
      return StatusCode.GatewayTimeout;
    case 505:
      return StatusCode.HTTPVersionNotSupported;
    case 506:
      return StatusCode.VariantAlsoNegotiates;
    case 507:
      return StatusCode.InsufficientStorage;
    case 508:
      return StatusCode.LoopDetected;
    case 510:
      return StatusCode.NotExtended;
    case 511:
      return StatusCode.NetworkAuthenticationRequired;
    default:
      return StatusCode.Unknown;
  }
}
