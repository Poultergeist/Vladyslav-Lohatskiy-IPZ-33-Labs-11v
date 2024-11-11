import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reset Password")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(labelText: "Email or Username"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => {
                showDialog(
                  context: context,
                  builder: (BuildContext ctx) {
                    return const AlertDialog(
                      title: Text('Message'),
                      content: Text("Password reset request sent"),
                    );
                  },
                )
              },
              child: const Text("Reset Password"),
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
