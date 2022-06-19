import 'package:example_routing_with_riverpod/pages/repo_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constants/style.dart';
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
    final textEditingController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('Repos')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(16),
            TextField(
              textInputAction: TextInputAction.search,
              controller: textEditingController,
              cursorColor: Colors.black26,
              cursorWidth: 1,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.black26, size: 24),
                prefixIconConstraints: BoxConstraints(minWidth: 36, maxWidth: 36),
                suffixIconConstraints: BoxConstraints(minWidth: 36, maxWidth: 36),
                contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                isDense: true,
                filled: false,
                hintText: '/repo/:owner/:repo',
                disabledBorder: textFieldBorder,
                enabledBorder: textFieldBorder,
                errorBorder: textFieldBorder,
                focusedErrorBorder: textFieldBorder,
                focusedBorder: textFieldBorder,
                border: textFieldBorder,
              ),
              // /repo/:owner/:repo のような location を指定して RepoDetailPage に遷移する
              onSubmitted: (location) => Navigator.pushNamed<void>(context, location),
            ),
            Expanded(
              child: ref.watch(searchRepoResponseFutureProvider).when<Widget>(
                    data: (searchRepoResponse) {
                      final repos = searchRepoResponse.repos;
                      return ListView.builder(
                        padding: const EdgeInsets.only(top: 8, bottom: 32),
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
                      padding: const EdgeInsets.only(top: 8, bottom: 32),
                      itemCount: 10,
                      itemBuilder: (context, index) => RepoItemWidget.shimmer,
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
