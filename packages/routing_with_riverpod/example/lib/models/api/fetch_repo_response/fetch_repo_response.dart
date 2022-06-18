import 'package:freezed_annotation/freezed_annotation.dart';

import '../../repo/repo.dart';
import '../base_response_data/base_response_data.dart';

part 'fetch_repo_response.freezed.dart';
part 'fetch_repo_response.g.dart';

@freezed
class FetchRepoResponse with _$FetchRepoResponse {
  const factory FetchRepoResponse({
    @Default(true) bool success,
    @Default('') String message,
    @Default(Repo.defaultValue) Repo repo,
  }) = _FetchRepoResponse;

  factory FetchRepoResponse.fromJson(Map<String, dynamic> json) =>
      _$FetchRepoResponseFromJson(json);

  factory FetchRepoResponse.fromBaseResponseData(BaseResponseData baseResponseData) =>
      FetchRepoResponse.fromJson(
        <String, dynamic>{
          'success': baseResponseData.success,
          'message': baseResponseData.message,
          ...baseResponseData.data,
        },
      );
}
