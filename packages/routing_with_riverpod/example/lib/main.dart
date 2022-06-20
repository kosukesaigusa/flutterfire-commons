import 'package:example_routing_with_riverpod/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import 'utils/application_documents_directory.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    ProviderScope(
      overrides: <Override>[
        applicationDocumentsDirectoryProvider.overrideWithValue(
          await getApplicationDocumentsDirectory(),
        ),
      ],
      child: const App(),
    ),
  );
}

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Routing with Riverpod',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: ref.watch(appRouterProvider).initialRoute,
      onGenerateRoute: ref.watch(appRouterProvider).onGenerateRoute,
    );
  }
}
