import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_application_01/screens/home/home.dart';
import 'package:test_application_01/services/character_store.dart';
import 'package:test_application_01/theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CharacterStore(),
      child: MaterialApp(theme: primaryTheme, home: Home()),
    ),
  );
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
