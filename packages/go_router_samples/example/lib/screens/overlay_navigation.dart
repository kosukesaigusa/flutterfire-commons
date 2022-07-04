import 'package:flutter/material.dart';

/// DialogやModalBottomSheetの挙動のサンプル
///
/// DialogやModalBottomSheetはnavigationBuilderで定義したNavigatorクラスのページスタック上に
/// 生成される為、`GoRouter.of(context).pop()`ではなく、`Navigator.of(context).pop()`を使う必要がある。
///
/// またModalBottomSheetでは`useRootNavigator`パラメータで明示的にRootに位置するNavigatorクラスか、
/// 一番近いNavigatorクラス(今回はGoRouterクラス)かを選択する事が出来る。
///
/// ただModalBottomSheetのpopはGoRouterでのpopに未対応の為、Navigatorのpopを使う必要がある。[参考](https://github.com/flutter/flutter/issues/100933)
class OverlayNavigationScreen extends StatelessWidget {
  const OverlayNavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Overlay Navigation'),
        ),
        body: SafeArea(
          child: Center(
            child: SizedBox(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _showDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(180, 45),
                    ),
                    child: const Text('Show dialog'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _showModalBottomSheet(context);
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(180, 45),
                    ),
                    child: const Text('Show bottom sheet'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _showNestedModalBottomSheet(context);
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(180, 45),
                    ),
                    child: const Text(
                      'Show nested bottom sheet',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showDialog(BuildContext context) async {
    await showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('This is the Dialog'),
          content: const Text('This is the content'),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              // RootのNavigatorクラスの上に生成されている為、Navigatorのpopを使用
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showModalBottomSheet(BuildContext context) async {
    await showModalBottomSheet<bool>(
      context: context,
      // trueにする事でRootのNavigatorクラス上にModalBottomSheetを表示
      useRootNavigator: true,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.share),
                title: const Text('Share'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.link),
                title: const Text('Copy'),
                onTap: () {},
              )
            ],
          ),
        );
      },
    );
  }

  Future<void> _showNestedModalBottomSheet(BuildContext context) async {
    await showModalBottomSheet<bool>(
      context: context,
      // falseの場合、一番近いNavigatorクラス上にModalBottomSheetを表示。(デフォルトがfalseの為、省略可)
      useRootNavigator: false,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24),
          height: 450,
          width: double.infinity,
          child: Column(
            children: [
              const Image(image: AssetImage('assets/images/flutter_icon.png')),
              const SizedBox(height: 24),
              TextButton(
                // GoRouterのpopがModalBottomSheet未対応の為、Navigator.popを使用
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('GO BACK'),
              ),
            ],
          ),
        );
      },
    );
  }
}
