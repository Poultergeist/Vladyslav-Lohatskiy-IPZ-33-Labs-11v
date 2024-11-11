import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(labelText: "Name"),
            ),
            const TextField(
              decoration: InputDecoration(labelText: "Username"),
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: "Password"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => {
                showDialog(
                  context: context,
                  builder: (BuildContext ctx) {
                    return const AlertDialog(
                      title: Text('Message'),
                      content: Text("Signup pressed"),
                    );
                  },
                )
              },
              child: const Text("Sign up"),
            ),
            OutlinedButton(
              onPressed: () => {
                Navigator.pop(context)
              },
              child: const Text("Back to Login"),
            ),
          ],
        ),
      ),
    );
  }
}
