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

# Flutter Advance Slider

Advance Slider is a versatile Flutter package that provides an advanced slider widget with customizable features. With this package, you can easily integrate a sleek and interactive slider component into your Flutter applications. Customize the appearance with different track colors, divisions, and even a custom thumb shape. The package also includes an option to display rhombus-shaped markers at specified intervals along the slider. Whether you need a simple slider or a more customized one, Advance Slider makes it easy to create engaging user interfaces. Give your users a seamless and intuitive way to select values with this powerful Flutter package.

![Advance Slider Example](https://drive.google.com/file/d/1Rj25yg-4OXH2duHPotYeDjzoc8nlfhmr/view?usp=sharing)

## Features

- Advanced slider widget with customizable features
- Customizable track colors, divisions, and thumb shape
- Option to display rhombus-shaped markers at specified intervals
- Easy integration into Flutter applications

## Getting Started

To start using the Advance Slider package, you need to add it as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_advance_slider: ^1.0.0

```
Then, run flutter pub get to fetch the package.

Import the package in your Dart code:

```dart
import 'package:flutter_advance_slider/AdvanceSlider.dart';
```

## Usage
Here's an example of how you can use the FlutterAdvanceSlider widget:

```dart
FlutterAdvanceSlider(
  min: 0,
  max: 100,
  dividerCount: 8,
)
```
In this example, a slider is created with a range from 0 to 100 and 8 dividers displayed in rhombus shape. Feel free to customize the values of min, max, and dividerCount to suit your needs.

You can add more instances of FlutterAdvanceSlider with different configurations to create sliders with varying features.

Make sure to wrap your widget tree with MaterialApp and Scaffold to provide the necessary structure for your app.


## License
This package is released under the MIT License.
