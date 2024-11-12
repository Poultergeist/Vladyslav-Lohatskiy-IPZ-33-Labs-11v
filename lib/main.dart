import 'package:flutter/material.dart';
import 'config_container.dart';
import 'provider/container_config.dart';
import 'config_slider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ContainerConfig(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Container Configurator',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const ContainerConfiguratorScreen(),
    );
  }
}

class ContainerConfiguratorScreen extends StatelessWidget {
  const ContainerConfiguratorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Container Configurator')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            ConfigContainer(),
            SizedBox(height: 20),
            ConfigSlider(),
          ],
        ),
      ),
    );
  }
}
