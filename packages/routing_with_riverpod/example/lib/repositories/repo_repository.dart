import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../services/api_client.dart';
import '../models/api/fetch_repo_response/fetch_repo_response.dart';
import '../models/api/search_repos_response/search_repos_response.dart';
import '../utils/exceptions/app_exception.dart';

final repoRepositoryProvider = Provider.autoDispose(
  (ref) => RepoRepository(client: ref.read(apiClientProvider)),
);

class RepoRepository {
  RepoRepository({required ApiClient client}) : _client = client;
  final ApiClient _client;

  /// 入力したキーワードで GET /search/repositories API をコールして、
  /// ヒットする GitHub リポジトリ一覧を含む SearchReposResponse を返す。
  Future<SearchReposResponse> searchRepos({
    required String q,
    int page = 1,
    int perPage = 10,
  }) async {
    final responseResult = await _client.get(
      '/search/repositories',
      queryParameters: <String, dynamic>{
        'q': q,
        'page': page,
        'per_page': perPage,
      },
    );
    return responseResult.when<SearchReposResponse>(
      success: SearchReposResponse.fromBaseResponseData,
      failure: (message) => throw AppException(message: message),
    );
  }

  /// GET /repos/{owner}/{repo} API をコールして指定した GitHub リポジトリを取得する。
  Future<FetchRepoResponse> fetchRepo({
    required String owner,
    required String repo,
  }) async {
    final responseResult = await _client.get('/repos/$owner/$repo');
    return responseResult.when<FetchRepoResponse>(
      success: FetchRepoResponse.fromBaseResponseData,
      failure: (message) => throw AppException(message: message),
    );
  }
}
