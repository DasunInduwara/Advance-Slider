library advance_slider;

import 'package:flutter/material.dart';

class RhombusPainter extends CustomPainter {
  final Color color;

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

class RhombusWidget extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  RhombusWidget(
      {required this.width, required this.height, required this.color});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RhombusPainter(color: color),
      size: Size(width, height),
    );
  }
}

class RhombusSlider extends StatefulWidget {
  RhombusSlider(
      {required this.min,
      required this.max,
      required this.divisions,
      required this.customThumb,
      required this.activeTrackColor,
      required this.inactiveTrackColor,
      required this.onChanged});

  double min;
  double max;
  int divisions;
  bool customThumb;
  Color activeTrackColor;
  Color inactiveTrackColor;
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
    widget.onChanged(
        value); // Call the onChanged callback provided by the parent widget
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
      child: Slider(
        value: _value,
        min: widget.min,
        max: widget.max,
        divisions: widget.divisions,
        label: _value.round().toString(),
        onChanged: updateSliderValue,
      ),
    );
  }
}

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

// main widget...
class AdvanceSlider extends StatefulWidget {
  AdvanceSlider({
    required this.min,
    required this.max,
    this.divderCount = 5,
    this.divders = true,
    this.customIcon,
    this.customThumb = true,
    this.activeTrackColor = Colors.blue,
    this.inactiveTrackColor = const Color.fromARGB(255, 207, 207, 207),
    this.onChanged = _defaultOnChanged,
  });

  double min;
  double max;
  int divderCount;
  bool divders;
  Icon? customIcon;
  bool customThumb;
  Color activeTrackColor;
  Color inactiveTrackColor;
  final ValueChanged<double> onChanged;

  static void _defaultOnChanged(double value) {}

  @override
  State<AdvanceSlider> createState() => _AdvanceSliderState();
}

class _AdvanceSliderState extends State<AdvanceSlider> {
  double _value = 0.0;

  void updateSliderValue(double value) {
    setState(() {
      _value = value;
    });
    widget.onChanged(
        value); // Call the onChanged callback provided by the parent widget
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(
            visible: widget.divders,
            child: Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
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
          customThumb: widget.customThumb,
          activeTrackColor: widget.activeTrackColor,
          inactiveTrackColor: widget.inactiveTrackColor,
          onChanged: updateSliderValue,
        ),
      ],
    );
  }
}
