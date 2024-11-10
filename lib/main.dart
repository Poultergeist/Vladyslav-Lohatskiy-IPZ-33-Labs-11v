import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const _size = 50.0;
const _bgColor = Colors.blue;
const _borderColor = Colors.black;
const _borderWidth = 2.0;
const _borderRadius = 25.0;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digit Pixel UI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Digit Pixel UI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: _buildFour(),
      ),
    );
  }

  List<Widget> _buildFour() {
    return [
      _buildLineAround(),
      _buildLineAround(),
      _buildLineTop(),
      _buildLineRight(),
      _buildLineRight(),
    ];
  }

  Widget _buildLineTop() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildDot(),
        _buildDot(),
        _buildDot(),
      ],
    );
  }

  Widget _buildLineLeft() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildDot(),
        _buildEmpty(),
        _buildEmpty(),
      ],
    );
  }

  Widget _buildLineRight() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildEmpty(),
        _buildEmpty(),
        _buildDot(),
      ],
    );
  }

  Widget _buildLineAround() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildDot(),
        _buildEmpty(),
        _buildDot(),
      ],
    );
  }

  Widget _buildDot() {
    return Container(
      width: _size,
      height: _size,
      decoration: BoxDecoration(
        color: _bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(_borderRadius)),
        border: Border.all(
          color: _borderColor,
          width: _borderWidth,
        ),
      ),
    );
  }

  Widget _buildEmpty() {
    return const SizedBox(
      width: _size,
      height: _size,
    );
  }
}
