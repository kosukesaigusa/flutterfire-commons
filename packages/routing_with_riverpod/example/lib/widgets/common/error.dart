import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants/string.dart';
import '../../utils/extensions/string.dart';

/// 何らかのエラーが起こっているときに表示するウィジェット
class AppErrorWidget extends StatefulHookConsumerWidget {
  const AppErrorWidget({
    super.key,
    this.errorObject,
    this.stackTrace,
  });

  final Object? errorObject;
  final StackTrace? stackTrace;

  @override
  ConsumerState<AppErrorWidget> createState() => _AppErrorWidgetState();
}

class _AppErrorWidgetState extends ConsumerState<AppErrorWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 300,
                  child: Text(
                    (widget.errorObject?.toString() ?? '').ifIsEmpty(generalExceptionMessage),
                  ),
                ),
                if (Navigator.of(context).canPop()) ...<Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('戻る'),
                  ),
                  const Gap(24),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
