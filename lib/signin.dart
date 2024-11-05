import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('signup Page'),
      ),
      body: Center(
        child: const Text(
          'Welcome to the signup Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
