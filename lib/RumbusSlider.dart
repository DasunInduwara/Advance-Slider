import 'package:flutter/material.dart';

class RhombusSlider extends StatefulWidget {
  RhombusSlider(
      {required this.min,
      required this.max,
      required this.divisions,
      required this.onChanged});

  double min;
  double max;
  int divisions;
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
      data: SliderThemeData(
        trackHeight: 4.0,
        activeTrackColor: Colors.blue,
        inactiveTrackColor: Colors.grey.withOpacity(0.3),
        thumbShape: _CustomThumbShape(),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 14.0),
      ),
      child: Slider(
        value: _value,
        min: widget.min ?? 0.0,
        max: widget.max ?? 100.0,
        divisions: widget.divisions,
        label: _value.round().toString(),
        onChanged: updateSliderValue,
      ),
    );
  }
}

class _CustomThumbShape extends SliderComponentShape {
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
