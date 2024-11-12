import 'package:flutter/material.dart';
import 'second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController _textController = TextEditingController();
  double _fontSize = 20.0;

  Future<void> _showDialog(String message) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enter Text"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: "Enter text",
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text("Font size: "),
                Expanded(
                  child: Slider(
                    min: 10.0,
                    max: 50.0,
                    value: _fontSize,
                    onChanged: (newValue) {
                      setState(() {
                        _fontSize = newValue;
                      });
                    },
                  ),
                ),
                Text(_fontSize.toStringAsFixed(0)),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondScreen(
                      text: _textController.text,
                      fontSize: _fontSize,
                    ),
                  ),
                );

                if (result == 'ok') {
                  _showDialog("Cool!");
                } else if (result == 'cancel') {
                  _showDialog("Let’s try something else");
                } else {
                  _showDialog("Don't know what to say");
                }
              },
              child: const Text("Preview"),
            ),
          ],
        ),
      ),
    );
  }
}
