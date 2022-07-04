import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        leading: BackButton(
          color: Colors.white,
          onPressed: () => GoRouter.of(context).pop(),
        ),
      ),
      body: const Center(
        child: Text('This is Login Page'),
      ),
    );
  }
}
