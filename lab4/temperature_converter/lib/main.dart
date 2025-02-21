import 'package:flutter/material.dart';

void main() {
  runApp(const TemperatureConverterMain());
}

class TemperatureConverterMain extends StatelessWidget {
  const TemperatureConverterMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TemperatureConverter(),
    );
  }
}

class TemperatureConverter extends StatefulWidget {
  const TemperatureConverter({super.key});

  @override
  State<TemperatureConverter> createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  int groupValue = 1; // tracks the value of the selected radio button
  double T = 0;       // entered temperature
  double R = 0;       // conversion result
  String converted = ""; // string representation of the conversion result

  void performConversion(int value) {
    setState(() {
      groupValue = value; // update radio selection
      if (value == 1) {
        // F to C conversion: °C = (°F - 32) x (5/9)
        R = (T - 32.0) * (5 / 9);
        converted = "$R C";
      } else if (value == 2) {
        // C to F conversion: °F = (°C x 9/5) + 32
        R = (T * 1.8) + 32;
        converted = "$R F";
      }
    });
  }

  // Determine text color based on resulting temperature
  Color getResultColor() {
    if (groupValue == 1) { // Fahrenheit to Celsius conversion
      if (T < 32) {
        return Colors.purple;
      } else if (T < 52) {
        return Colors.blue;
      } else if (T < 72) {
        return Colors.green;
      } else if (T < 82) {
        return Colors.yellow;
      } else {
        return Colors.red;
      }
    } else { // Celsius to Fahrenheit conversion
      if (T < 0) {
        return Colors.purple;
      } else if (T < 11) {
        return Colors.blue;
      } else if (T < 22) {
        return Colors.green;
      } else if (T < 27) {
        return Colors.yellow;
      } else {
        return Colors.red;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Define slider range based on conversion type
    double sliderMin = groupValue == 1 ? 32.0 : 0.0;
    double sliderMax = groupValue == 1 ? 212.0 : 100.0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Temperature Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 10.0),
            TextField(
              decoration: const InputDecoration(labelText: 'Enter Temperature'),
              onChanged: (String value) {
                setState(() {
                  T = double.tryParse(value) ?? 0;
                  performConversion(groupValue);
                });
              },
            ),
            const SizedBox(height: 10.0),
            // Slider to adjust the temperature value
            Slider(
              value: T.clamp(sliderMin, sliderMax),
              min: sliderMin,
              max: sliderMax,
              divisions: (sliderMax - sliderMin).toInt(),
              label: T.toStringAsFixed(1),
              onChanged: (double value) {
                T = value;
                performConversion(groupValue);
              },
              activeColor: getResultColor(),
            ),
            const SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                Radio(
                  activeColor: Colors.orange,
                  value: 1,
                  groupValue: groupValue,
                  onChanged: (e) => performConversion((e!)),
                ),
                const Text("F to C"),
                const SizedBox(width: 10.0),
                Radio(
                  activeColor: Colors.orange,
                  value: 2,
                  groupValue: groupValue,
                  onChanged: (e) => performConversion((e!)),
                ),
                const Text("C to F"),
              ],
            ),
            const SizedBox(height: 10.0),
            TextButton(
              child: const Text('Clear'),
              onPressed: () {
                setState(() {
                  T = 0;
                  R = 0;
                  converted = "";
                });
              },
            ),
            const SizedBox(height: 20.0),
            Text(
              converted
            ),
          ],
        ),
      ),
    );
  }
}