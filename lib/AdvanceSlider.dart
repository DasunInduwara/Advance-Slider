library advance_slider;

import 'package:flutter/material.dart';

/// A custom painter that draws a rhombus shape with the specified color.
class RhombusPainter extends CustomPainter {
  final Color color;

  /// Creates a [RhombusPainter] with the given [color].
  RhombusPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height / 2)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(0, size.height / 2)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

/// A widget that displays a rhombus shape with the specified width, height, and color.
class RhombusWidget extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  /// Creates a [RhombusWidget] with the given [width], [height], and [color].
  RhombusWidget({required this.width, required this.height, required this.color});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RhombusPainter(color: color),
      size: Size(width, height),
    );
  }
}

/// A slider widget that displays rhombus shapes as the thumb.
class RhombusSlider extends StatefulWidget {
  const RhombusSlider({
    Key? key,
    required this.min,
    required this.max,
    required this.showLable,
    required this.divisions,
    required this.customThumb,
    required this.activeTrackColor,
    required this.inactiveTrackColor,
    required this.onChanged,
  }) : super(key: key);

  /// The minimum value of the slider.
  final double min;

  /// The maximum value of the slider.
  final double max;

  /// Whether to show the value label on the slider.
  final bool showLable;

  /// The number of discrete divisions on the slider track.
  final int divisions;

  /// Whether to use a custom rhombus shape for the thumb.
  final bool customThumb;

  /// The color of the active track.
  final Color activeTrackColor;

  /// The color of the inactive track.
  final Color inactiveTrackColor;

  /// Called when the value of the slider changes.
  final ValueChanged<double> onChanged;

  @override
  _RhombusSliderState createState() => _RhombusSliderState();
}

class _RhombusSliderState extends State<RhombusSlider> {
  double _value = 0.0;

  void updateSliderValue(double value) {
    setState(() {
      _value = value;
    });
    widget.onChanged(value); // Call the onChanged callback provided by the parent widget
  }

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: widget.customThumb
          ? SliderThemeData(
              trackHeight: 4.0,
              activeTrackColor: Colors.blue,
              inactiveTrackColor: Colors.grey.withOpacity(0.3),
              thumbShape: _CustomRhombusThumbShape(),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 14.0),
            )
          : SliderThemeData(
              trackHeight: 4.0,
              activeTrackColor: Colors.blue,
              inactiveTrackColor: Colors.grey.withOpacity(0.3),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 14.0),
            ),
      child: widget.showLable
          ? Slider(
              value: _value,
              min: widget.min,
              max: widget.max,
              divisions: widget.divisions,
              label: _value.round().toString(),
              onChanged: updateSliderValue,
            )
          : Slider(
              value: _value,
              min: widget.min,
              max: widget.max,
              onChanged: updateSliderValue,
            ),
    );
  }
}

/// A custom thumb shape for the slider that displays a rhombus shape.
class _CustomRhombusThumbShape extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size.fromRadius(14.0);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    Animation<double>? activationAnimation,
    Animation<double>? enableAnimation,
    bool? isDiscrete,
    bool? isEnabled,
    bool? isOnTop,
    TextPainter? labelPainter,
    required RenderBox parentBox,
    SliderThemeData? sliderTheme,
    TextDirection? textDirection,
    double? value,
    double? textScaleFactor,
    Size? sizeWithOverflow,
  }) {
    final canvas = context.canvas;
    final rect = Rect.fromCircle(center: center, radius: 8.0);
    final paint = Paint()..color = Colors.blue;

    canvas.drawPath(
      _createRhombusPath(rect),
      paint,
    );
  }

  Path _createRhombusPath(Rect rect) {
    final path = Path();
    path.moveTo(rect.left, rect.center.dy);
    path.lineTo(rect.center.dx, rect.top);
    path.lineTo(rect.right, rect.center.dy);
    path.lineTo(rect.center.dx, rect.bottom);
    path.close();
    return path;
  }
}

/// A more advanced slider widget that combines the rhombus slider and the rhombus dividers.
class FlutterAdvanceSlider extends StatefulWidget {
  const FlutterAdvanceSlider({
    Key? key,
    required this.min,
    required this.max,
    this.showLable = true,
    this.divderCount = 5,
    this.displayDivders = true,
    this.customIcon,
    this.showCustomThumb = true,
    this.activeTrackColor = Colors.blue,
    this.inactiveTrackColor = const Color.fromARGB(255, 207, 207, 207),
    this.onChanged = _defaultOnChanged,
  }) : super(key: key);

  /// The minimum value of the slider.
  final double min;

  /// The maximum value of the slider.
  final double max;

  /// Whether to show the value label on the slider.
  final bool showLable;

  /// The number of dividers to display.
  final int divderCount;

  /// Whether to display the dividers.
  final bool displayDivders;

  /// The custom icon to use for dividers (if provided).
  final Icon? customIcon;

  /// Whether to show a custom rhombus thumb.
  final bool showCustomThumb;

  /// The color of the active track.
  final Color activeTrackColor;

  /// The color of the inactive track.
  final Color inactiveTrackColor;

  /// Called when the value of the slider changes.
  final ValueChanged<double> onChanged;

  static void _defaultOnChanged(double value) {}

  @override
  State<FlutterAdvanceSlider> createState() => _FlutterAdvanceSliderState();
}

class _FlutterAdvanceSliderState extends State<FlutterAdvanceSlider> {
  double _value = 0.0;

  void updateSliderValue(double value) {
    setState(() {
      _value = value;
    });
    widget.onChanged(value); // Call the onChanged callback provided by the parent widget
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(
            visible: widget.displayDivders,
            child: Positioned.fill(
              child: Padding(
                padding: widget.showCustomThumb
                    ? const EdgeInsets.only(left: 10, right: 10)
                    : EdgeInsets.zero,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: widget.customIcon == null
                      ? List.generate(
                          widget.divderCount,
                          (index) => RhombusWidget(
                              width: 12, height: 12, color: Colors.blue))
                      : List.generate(
                          widget.divderCount, (index) => widget.customIcon!),
                ),
              ),
            )),
        RhombusSlider(
          divisions: double.parse(widget.max.toString()).toInt(),
          max: widget.max,
          min: widget.min,
          showLable: widget.showLable,
          customThumb: widget.showCustomThumb,
          activeTrackColor: widget.activeTrackColor,
          inactiveTrackColor: widget.inactiveTrackColor,
          onChanged: updateSliderValue,
        ),
      ],
    );
  }
}
