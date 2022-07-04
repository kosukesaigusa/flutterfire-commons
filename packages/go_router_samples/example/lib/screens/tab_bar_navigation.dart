import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// `BottomNavigationBar`と`TabBar`を併用した挙動のサンプル
///
/// `TabBarView`内からネストした画面へも問題なく遷移可能
class TabBarNavigationScreen extends StatefulWidget {
  const TabBarNavigationScreen({super.key, this.index = 0});
  final int index;

  @override
  State<TabBarNavigationScreen> createState() => _TabBarNavigationScreenState();
}

class _TabBarNavigationScreenState extends State<TabBarNavigationScreen>
    with TickerProviderStateMixin {
  late final TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: 3,
      vsync: this,
      initialIndex: widget.index,
    );
  }

  @override
  void didUpdateWidget(TabBarNavigationScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.index = widget.index;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tab Bar Navigation'),
          bottom: TabBar(
            controller: _controller,
            tabs: const <Widget>[
              Tab(text: 'A'),
              Tab(text: 'B'),
              Tab(text: 'C'),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            controller: _controller,
            children: const <Widget>[
              TabA(),
              TabB(),
              TabC(),
            ],
          ),
        ),
      ),
    );
  }
}

class TabA extends StatelessWidget {
  const TabA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.go('/tab_bar/page_a');
              },
              style: ElevatedButton.styleFrom(primary: Colors.red),
              child: const Text('GO TO PAGE A'),
            ),
          ],
        ),
      ),
    );
  }
}

class TabB extends StatelessWidget {
  const TabB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.go('/tab_bar/page_b');
              },
              style: ElevatedButton.styleFrom(primary: Colors.green),
              child: const Text('GO TO PAGE B'),
            ),
          ],
        ),
      ),
    );
  }
}

class TabC extends StatelessWidget {
  const TabC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.go('/tab_bar/page_c');
              },
              style: ElevatedButton.styleFrom(primary: Colors.yellow),
              child: const Text(
                'GO TO PAGE C',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PageA extends StatelessWidget {
  const PageA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: Colors.red,
        child: Stack(
          children: [
            Positioned(
              left: 16,
              top: 32,
              child: IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                iconSize: 36,
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'PAGE A',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PageB extends StatelessWidget {
  const PageB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: Colors.green,
        child: Stack(
          children: [
            Positioned(
              left: 16,
              top: 32,
              child: IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                iconSize: 36,
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'PAGE B',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PageC extends StatelessWidget {
  const PageC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: Colors.yellow,
        child: Stack(
          children: [
            Positioned(
              left: 16,
              top: 32,
              child: IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                iconSize: 36,
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'PAGE C',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
