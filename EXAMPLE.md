## Example

Below is an example usage of the `FlutterAdvanceSlider` widget with different configurations:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_advance_slider/AdvanceSlider.dart';

class ExampleApp extends StatefulWidget {
  @override
  _ExampleAppState createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  double value = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 80,),
                // Title
                Text(
                  "Flutter Advance Slider",
                  style: TextStyle(color: Colors.blue, fontSize: 24),
                ),

                SizedBox(height: 130,),
                // Simple slider without dividers and labels
                FlutterAdvanceSlider(
                  min: 0,
                  max: 20,
                  displayDividers: false,
                  showLabel: false,
                ),

                SizedBox(height: 30),

                // Normal slider without dividers, labels, and custom thumb
                FlutterAdvanceSlider(
                  min: 0,
                  max: 20,
                  displayDividers: false,
                  showLabel: false,
                  showCustomThumb: false,
                ),

                SizedBox(height: 30),

                // Rhombus slider with default 5 dividers
                FlutterAdvanceSlider(
                  min: 0,
                  max: 100,
                ),

                SizedBox(height: 30),

                // Rhombus slider with 8 dividers
                FlutterAdvanceSlider(
                  min: 0,
                  max: 100,
                  dividerCount: 8,
                ),

                SizedBox(height: 40),

                // Slider with custom divider icons and no custom thumb
                Text("Value $value"),

                const SizedBox(height: 20),
                FlutterAdvanceSlider(
                  min: 0,
                  max: 100,
                  customIcon: const Icon(
                    Icons.radio_button_checked,
                    color: Colors.blue,
                  ),
                  showCustomThumb: false,
                  onChanged: (value) {
                    setState(() {
                      this.value = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(ExampleApp());
}
