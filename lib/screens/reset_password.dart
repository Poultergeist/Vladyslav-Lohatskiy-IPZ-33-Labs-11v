import 'package:flutter/material.dart';
import './log_in_screen.dart'; // Import the login screen to navigate back.

class ResetPasswordScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/1024px-Google-flutter-logo.svg.png",
              width: 200,
            ),
            SizedBox(height: 20.0),
            // Wrap the form fields in a Form widget for validation
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Email",
                      textAlign: TextAlign.left,
                      textWidthBasis: TextWidthBasis.parent,
                    ),
                  ),
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email';
                      }
                      // Basic email regex pattern
                      final emailRegex =
                          RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                      if (!emailRegex.hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
            // Reset Button
            Container(
              width: double.infinity,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 20.0), // Padding for text inside the button
                ),
                child: Text("Reset Password"),
                onPressed: () {
                  // Validate the form and show appropriate message
                  if (_formKey.currentState?.validate() ?? false) {
                    showDialog(
                      context: context,
                      builder: (BuildContext ctx) {
                        return const AlertDialog(
                          title: Text('Message'),
                          content: Text(
                              "Password reset link has been sent to your email!"),
                        );
                      },
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext ctx) {
                        return const AlertDialog(
                          title: Text('Message'),
                          content: Text(
                              "There is an issue with your input. Please fix it."),
                        );
                      },
                    );
                  }
                },
              ),
            ),
            SizedBox(height: 20.0),
            // Back Button
            Container(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 20.0), // Padding for text inside the button
                ),
                child: Text("Back"),
                onPressed: () {
                  // Navigate back to the login screen
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
