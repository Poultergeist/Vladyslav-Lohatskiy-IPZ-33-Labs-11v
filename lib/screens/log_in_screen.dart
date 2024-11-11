import 'package:flutter/material.dart';
import './sign_up_screen.dart';
import './reset_password.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

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
            SizedBox(
              height: 20.0,
            ),
            // Wrap the form fields in a Form widget
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
                  SizedBox(
                    height: 20.0,
                  ),
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
                        return "Please enter password";
                      }

                      if (value.length < 7) {
                        return "Password is too short";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
            // Sign Up Button
            Container(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 20.0), // Padding for text inside the button
                ),
                child: Text("Sign Up"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20.0),
            // Login button and Reset password link
            Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: () {
                      // Check if the form is valid before showing a dialog
                      if (_formKey.currentState?.validate() ?? false) {
                        showDialog(
                          context: context,
                          builder: (BuildContext ctx) {
                            return const AlertDialog(
                              title: Text('Message'),
                              content: Text("All is okay!"),
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
                    child: Text("Login"),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResetPasswordScreen()));
                    },
                    child: Text("Reset password"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
