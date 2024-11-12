import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/container_config.dart';

class ConfigContainer extends StatelessWidget {
  const ConfigContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final config = Provider.of<ContainerConfig>(context);
    return Center(
      child: Container(
        width: config.width,
        height: config.height,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(config.borderRadius),
          ),
        ),
      ),
    );
  }
}
