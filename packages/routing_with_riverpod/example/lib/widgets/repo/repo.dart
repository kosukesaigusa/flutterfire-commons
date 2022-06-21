import 'package:example_routing_with_riverpod/utils/extensions/int.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

import '../../models/repo/repo.dart';
import '../common/shimmer.dart';

/// GitHub リポジトリのひとつひとつのアイテムウィジェット
class RepoItemWidget extends StatelessWidget {
  const RepoItemWidget({
    super.key,
    required this.repo,
    this.onTap,
  });

  /// 表示する Repo インスタンス
  final Repo repo;

  /// タップしたときの挙動
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const FaIcon(FontAwesomeIcons.github),
            const Gap(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    repo.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Gap(4),
                  Text(
                    repo.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const Gap(8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.star, size: 12),
                    const Gap(4),
                    Text(
                      repo.stargazersCount.withComma,
                    ),
                  ],
                ),
                const Gap(4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const FaIcon(FontAwesomeIcons.codeFork, size: 12),
                    const Gap(4),
                    Text(
                      repo.forksCount.withComma,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget get shimmer => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FaIcon(FontAwesomeIcons.github),
            const Gap(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ShimmerWidget.rectangular(width: 120, height: 16, borderRadius: 8),
                  const Gap(8),
                  for (var i = 0; i < 2; i++) ...[
                    const ShimmerWidget.rectangular(
                      width: double.infinity,
                      height: 12,
                      borderRadius: 8,
                    ),
                    const Gap(8),
                  ],
                ],
              ),
            ),
            const Gap(8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                ShimmerWidget.rectangular(width: 100, height: 12, borderRadius: 8),
                Gap(8),
                ShimmerWidget.rectangular(width: 100, height: 12, borderRadius: 8),
              ],
            ),
          ],
        ),
      );
}
