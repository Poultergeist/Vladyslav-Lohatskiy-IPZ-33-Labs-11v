import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/container_config.dart';

class ConfigSlider extends StatelessWidget {
  const ConfigSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final config = Provider.of<ContainerConfig>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Width:'),
        Slider(
          value: config.width,
          min: 50,
          max: 300,
          divisions: 25,
          label: config.width.toStringAsFixed(0),
          onChanged: (value) {
            config.updateWidth(value);
          },
        ),
        const Text('Height:'),
        Slider(
          value: config.height,
          min: 50,
          max: 300,
          divisions: 25,
          label: config.height.toStringAsFixed(0),
          onChanged: (value) {
            config.updateHeight(value);
          },
        ),
        const Text('Top-Right Border Radius:'),
        Slider(
          value: config.borderRadius,
          min: 0,
          max: 50,
          divisions: 10,
          label: config.borderRadius.toStringAsFixed(0),
          onChanged: (value) {
            config.updateBorderRadius(value);
          },
        ),
      ],
    );
  }
}
