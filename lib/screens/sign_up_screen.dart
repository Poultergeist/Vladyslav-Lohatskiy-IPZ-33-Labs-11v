import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import './log_in_screen.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final Dio _dio = Dio();
  final String _requestCatcherUrl = "https://vlohatskiy-lab12.requestcatcher.com";  // Ваш субдомен

  // Функція для відправки запиту на реєстрацію
  Future<void> _sendSignUpRequest(BuildContext context) async {
    try {
      final response = await _dio.post(
        '$_requestCatcherUrl/signup',
        data: {
          'name': _nameController.text,
          'email': _emailController.text,
          'password': _passwordController.text,
        },
      );
      print('Response: ${response.data}');
      showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text('Sign Up Successful'),
            content: Text('Welcome, ${_nameController.text}!'),
          );
        },
      );
    } catch (e) {
      print('Error: $e');
      showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text('Sign Up Failed'),
            content: Text('Error occurred: $e'),
          );
        },
      );
    }
  }

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
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child:
                    Text("Name"),
                  ),
                  TextFormField(
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 5) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  SizedBox(height: 20.0),Align(
                    alignment: Alignment.centerLeft,
                    child:
                    Text("Email"),
                  ),
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email';
                      }
                      final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                      if (!emailRegex.hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  SizedBox(height: 20.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child:
                    Text("Password"),
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      if (value.length < 7) {
                        return 'Password is too short';
                      }
                      return null;
                    },
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
            FilledButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  _sendSignUpRequest(context);
                }
              },
              child: Text("Sign Up"),
            ),
            SizedBox(height: 20.0),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
              child: Text("Already have an account? Login"),
            ),
          ],
        ),
      ),
    );
  }
}
