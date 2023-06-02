library rombus_slider_pkg;

import 'package:flutter/material.dart';

import 'RumbusSlider.dart';
import 'ShapeWidget.dart';

class AdvanceSlider extends StatefulWidget {
  AdvanceSlider(
      {Key? key,
      required this.min,
      required this.max,
      required this.divisions,
      required this.onChanged})
      : super(key: key);

  double min;
  double max;
  int divisions;
  final ValueChanged<double> onChanged;

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
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  5,
                  (index) =>
                      RhombusWidget(width: 12, height: 12, color: Colors.blue)),
            ),
          ),
        ),
        RhombusSlider(
          divisions: 100,
          max: 100,
          min: 0.0,
          onChanged: updateSliderValue,
        ),
      ],
    );
  }
}
