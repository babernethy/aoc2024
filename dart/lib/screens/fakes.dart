import 'package:flutter/material.dart';

class FakeLoginPage extends StatelessWidget {
  const FakeLoginPage({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(child: Text('Login Page')),
      );
}

class FakeHomePage extends StatelessWidget {
  const FakeHomePage({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(child: Text('Home Page')),
      );
}

class FakeErrorPage extends StatelessWidget {
  const FakeErrorPage(this.error, {super.key});
  final String error;
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(child: Text(error)),
      );
}
