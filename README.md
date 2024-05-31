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

A Widget for `Linguabound` App

## Getting started

Go to `pubspec.yaml` file, and add this package as dependencies:
```yaml
dependencies:
  ...
  linguabound_widget:
    git:
      url: https://github.com/BlastTea/linguabound_widget.git
      ref: #last_commit_hash

...

flutter:
  fonts:
    - family: FeatherBold
      fonts:
        - asset: packages/linguabound_widget/fonts/FeatherBold/FeatherBold.ttf
```
then, import it
```dart
import 'pakcage:linguabound_widget/linguabound_widget.dart';
```

## Usage

```dart
void main() async {
    WidgetsFlutterBinding.ensureInitialized();

    await LinguaboundWidget.initialized();

    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) => LinguaboundMaterialApp(
        home: const HomePage(),
    );
}
```

## Other Widget
- LargeCoiceChip
- MyFilledButton
- MyFilledButton.circle
- MyNavigationBar