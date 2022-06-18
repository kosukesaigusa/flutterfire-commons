import 'package:example_routing_with_riverpod/pages/repo_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/api/search_repos_response/search_repos_response.dart';
import '../repositories/repo_repository.dart';
import '../widgets/repo/repo.dart';

/// q=flutter で GitHub の Search Repositories API を コールし、
/// そのレスポンスを提供する FutureProvider。
final searchRepoResponseFutureProvider =
    FutureProvider.autoDispose<SearchReposResponse>((ref) async {
  final response = await ref.read(repoRepositoryProvider).searchRepositories(
        q: 'flutter',
        page: 1,
        perPage: 10,
      );
  return response;
});

/// GitHub リポジトリの "flutter" で検索した結果一覧のページ。
class ReposPage extends HookConsumerWidget {
  const ReposPage({super.key});

  static const path = '/';
  static const name = 'ReposPage';
  static String location = path;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Repos')),
      body: ref.watch(searchRepoResponseFutureProvider).when<Widget>(
            data: (searchRepoResponse) {
              final repos = searchRepoResponse.repos;
              return ListView.builder(
                itemCount: repos.length,
                itemBuilder: (context, index) {
                  final repo = repos[index];
                  return RepoItemWidget(
                    repo: repo,
                    onTap: () => Navigator.pushNamed<void>(
                      context,
                      RepoDetailPage.location(owner: repo.owner.login, repo: repo.name),
                      // ここでは Repo インスタンスをルート引数に指定しているので、
                      // RepoDetailPage では GET Repo API はコールされない。
                      arguments: repo,
                    ),
                  );
                },
              );
            },
            error: (_, __) => const SizedBox(),
            loading: () => ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => RepoItemWidget.shimmer,
            ),
          ),
    );
  }
}
