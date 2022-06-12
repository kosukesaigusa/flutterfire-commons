import 'package:flutter/material.dart';

/// [AppLifecycleState] が変更した時に State に応じてメソッドを呼び出すことができる
class LifeCycle extends StatefulWidget {
  const LifeCycle({
    Key? key,
    required this.child,
    this.onInactive,
    this.onResumed,
    this.onPaused,
    this.onDetached,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onInactive;
  final VoidCallback? onResumed;
  final VoidCallback? onPaused;
  final VoidCallback? onDetached;

  @override
  _LifeCycleState createState() => _LifeCycleState();
}

class _LifeCycleState extends State<LifeCycle> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive) {
      widget.onInactive?.call();
    } else if (state == AppLifecycleState.resumed) {
      widget.onResumed?.call();
    } else if (state == AppLifecycleState.paused) {
      widget.onPaused?.call();
    } else if (state == AppLifecycleState.detached) {
      widget.onDetached?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
