import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: false,
      ),
      home: ConfiguratorScreen(),
    );
  }
}

class ConfiguratorScreen extends StatefulWidget {
  @override
  _ConfiguratorScreenState createState() => _ConfiguratorScreenState();
}

class _ConfiguratorScreenState extends State<ConfiguratorScreen> {
  double topLeftRadius = 0.0;
  double topRightRadius = 0.0;
  double bottomLeftRadius = 0.0;
  double bottomRightRadius = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container Configurator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(topLeftRadius),
                  topRight: Radius.circular(topRightRadius),
                  bottomLeft: Radius.circular(bottomLeftRadius),
                  bottomRight: Radius.circular(bottomRightRadius),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Adjust Corner Radius',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Grid of sliders for each corner
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSlider("TL", topLeftRadius, (value) {
                  setState(() {
                    topLeftRadius = value;
                  });
                }),
                _buildSlider("TR", topRightRadius, (value) {
                  setState(() {
                    topRightRadius = value;
                  });
                }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSlider("BL", bottomLeftRadius, (value) {
                  setState(() {
                    bottomLeftRadius = value;
                  });
                }),
                _buildSlider("BR", bottomRightRadius, (value) {
                  setState(() {
                    bottomRightRadius = value;
                  });
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSlider(String label, double value, ValueChanged<double> onChanged) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('$label: ${value.toStringAsFixed(0)}'),
        Slider(
          value: value,
          min: 0,
          max: 150,
          divisions: 150,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
