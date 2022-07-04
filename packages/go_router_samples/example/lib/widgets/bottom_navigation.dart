import 'package:example_go_router_samples/providers/bottom_navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BottomNav extends ConsumerStatefulWidget {
  const BottomNav({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BottomNavState();
}

class _BottomNavState extends ConsumerState<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          widget.child,
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: ref.watch(bottomNavIndexProvider),
              onTap: (i) {
                ref.read(bottomNavIndexProvider.notifier).update((state) => i);

                // indexに応じてGoRouterのページに遷移
                switch (i) {
                  case 0:
                    context.go('/simple');
                    break;
                  case 1:
                    context.go('/overlay');
                    break;
                  case 2:
                    context.go('/tab_bar');
                    break;
                }
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.grey,
                    ),
                    label: 'Simple'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.replay,
                      color: Colors.grey,
                    ),
                    label: 'Overlay'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.tab,
                      color: Colors.grey,
                    ),
                    label: 'TabBar'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
