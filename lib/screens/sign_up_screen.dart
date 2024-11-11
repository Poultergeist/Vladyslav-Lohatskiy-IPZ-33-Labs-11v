import 'package:flutter/material.dart';
import './log_in_screen.dart'; // Import the LoginScreen to navigate back.

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
            Text("Sign up"),
            SizedBox(height: 20.0),
            // Wrap the form fields in a Form widget for validation
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Name",
                      textAlign: TextAlign.left,
                      textWidthBasis: TextWidthBasis.parent,
                    ),
                  ),
                  TextFormField(
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      if (value.length < 5) {
                        return 'Name must be at least 5 characters';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20.0),
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Password",
                      textAlign: TextAlign.left,
                      textWidthBasis: TextWidthBasis.parent,
                    ),
                  ),
                  TextFormField(
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      if (value.length < 7) {
                        return 'Password must be at least 7 characters';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
            // Sign Up Button
            Container(
              width: double.infinity,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 20.0), // Padding for text inside the button
                ),
                child: Text("Sign Up"),
                onPressed: () {
                  // Validate the form and show appropriate message
                  if (_formKey.currentState?.validate() ?? false) {
                    showDialog(
                      context: context,
                      builder: (BuildContext ctx) {
                        return const AlertDialog(
                          title: Text('Message'),
                          content: Text("Sign up successful!"),
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
