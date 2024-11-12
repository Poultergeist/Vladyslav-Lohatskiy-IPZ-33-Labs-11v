import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import './log_in_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final Dio _dio = Dio();
  final String _requestCatcherUrl = "https://vlohatskiy-lab12.requestcatcher.com";  // Ваш субдомен

  // Функція для відправки запиту на скидання пароля
  Future<void> _sendResetPasswordRequest(BuildContext context) async {
    try {
      final response = await _dio.post(
        '$_requestCatcherUrl/reset_password',
        data: {
          'email': _emailController.text,
        },
      );
      print('Response: ${response.data}');
      showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text('Password Reset Request Sent'),
            content: Text('Check your email for instructions to reset your password.'),
          );
        },
      );
    } catch (e) {
      print('Error: $e');
      showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text('Failed to Reset Password'),
            content: Text('An error occurred: $e'),
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
            Text("Reset Password"),
            SizedBox(height: 20.0),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
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
                ],
              ),
            ),
            FilledButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  _sendResetPasswordRequest(context);
                }
              },
              child: Text("Send Reset Link"),
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
              child: Text("Back to Login"),
            ),
          ],
        ),
      ),
    );
  }
}
