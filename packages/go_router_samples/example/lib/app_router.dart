import 'package:example_go_router_samples/screens/error_screen.dart';
import 'package:example_go_router_samples/screens/login_screen.dart';
import 'package:example_go_router_samples/screens/number_screen.dart';
import 'package:example_go_router_samples/screens/overlay_navigation.dart';
import 'package:example_go_router_samples/screens/simple_navigation.dart';
import 'package:example_go_router_samples/screens/tab_bar_navigation.dart';
import 'package:example_go_router_samples/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider(
  (ref) => GoRouter(
    initialLocation: '/simple',
    routes: <GoRoute>[
      GoRoute(
        name: 'simple',
        path: '/simple',
        pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const SimpleNavigationScreen(),
            transitionDuration: Duration.zero,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child),
        routes: [
          GoRoute(
            name: 'login',
            path: 'login',
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: const LoginScreen(),
            ),
          ),
          GoRoute(
            name: 'number',
            path: 'number/:id',
            builder: (context, state) {
              final id = state.params['id']!;
              return NumberScreen(number: id);
            },
          ),
        ],
      ),
      GoRoute(
        name: 'overlay',
        path: '/overlay',
        pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const OverlayNavigationScreen(),
            transitionDuration: Duration.zero,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child),
      ),
      GoRoute(
        name: 'tab_bar',
        path: '/tab_bar',
        routes: [
          GoRoute(
            name: 'pageA',
            path: 'page_a',
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: PageA(key: state.pageKey),
            ),
          ),
          GoRoute(
            name: 'pageB',
            path: 'page_b',
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: PageB(key: state.pageKey),
            ),
          ),
          GoRoute(
            name: 'pageC',
            path: 'page_c',
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: PageC(key: state.pageKey),
            ),
          ),
        ],
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const TabBarNavigationScreen(),
          transitionDuration: Duration.zero,
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              child,
        ),
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: ErrorScreen(
        exception: state.error,
      ),
    ),
    navigatorBuilder: (context, state, child) {
      //
      return Navigator(
        onPopPage: (route, dynamic __) => false,
        pages: [
          MaterialPage<Widget>(
            child: BottomNav(
              child: child,
            ),
          ),
        ],
      );
    },
  ),
);
