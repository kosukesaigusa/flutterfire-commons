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

![CleanShot 2022-05-12 at 22 20 23](https://user-images.githubusercontent.com/43805056/168607586-b3e0fa3c-0821-41fd-88c0-f4cf59e6748f.gif)

## Usage

### LifeCycle

```dart
LifeCycle(
    child: const Text('Child'),
    onInactive: () {
        debugPrint('state is inactive');
    },
    onResumed: () {
        debugPrint('state is resumed');
    },
    onPaused: () {
        debugPrint('state is paused');
    },
    onDetached: () {
        debugPrint('state is detached');
    },
);
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
