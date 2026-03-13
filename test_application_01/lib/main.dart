import 'package:flutter/material.dart';
import 'package:test_application_01/screens/home/home.dart';

void main() {
  runApp(const MaterialApp(home: Home()));
}

class SandBox extends StatelessWidget {
  const SandBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Box'),
        backgroundColor: Colors.grey,
      ),
      body: const Text("send box"),
    );
  }
}
