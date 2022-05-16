<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.
For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).
For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

## Features

### LifeCycle

Methods can be called according to State when AppLifecycleState changes

## Usage

### LifeCycle

```dart
LifeCycle(
    child: const Text('Child'),
    onInactive: () {
        debugPrint('CurrentState: inactive');
    },
    onResumed: () {
        debugPrint('CurrentState: resumed');
    },
    onPaused: () {
        debugPrint('CurrentState: paused');
    },
    onDetached: () {
        debugPrint('CurrentState: detached');
    },
);
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
