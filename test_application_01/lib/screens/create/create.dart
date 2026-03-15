import 'package:flutter/material.dart';
import 'package:test_application_01/models/vocation.dart';
import 'package:test_application_01/screens/create/vocation_card.dart';
import 'package:test_application_01/shared/styled_button.dart';
import 'package:test_application_01/shared/styled_text.dart';
import 'package:test_application_01/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

  void submitHandler() {
    if (_nameController.text.trim().isEmpty) {
      print("Name must not be empty");
      return;
    }
    if (_sloganController.text.trim().isEmpty) {
      print("Slogan must not be empty");
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledTitle("Create Characters"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          children: [
            Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
            const Center(child: StyledHeading("welcome new player")),
            const Center(
              child: StyledText("Create a name & slogan for your character."),
            ),
            const SizedBox(height: 30),

            TextField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_2),
                label: StyledText("Character name"),
              ),
              style: GoogleFonts.kanit(
                textStyle: Theme.of(context).textTheme.bodyMedium,
              ),
              cursorColor: AppColors.textColor,
              controller: _nameController,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.chat),
                label: StyledText("Character slogan"),
              ),
              style: GoogleFonts.kanit(
                textStyle: Theme.of(context).textTheme.bodyMedium,
              ),
              cursorColor: AppColors.textColor,
              controller: _sloganController,
            ),
            const SizedBox(height: 20),

            Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
            const Center(child: StyledHeading("choose a vocation")),
            const Center(
              child: StyledText("This determines your available skills"),
            ),
            const SizedBox(height: 30),
            const VocationCard(vocation: Vocation.junkie),
            const VocationCard(vocation: Vocation.ninja),
            const VocationCard(vocation: Vocation.raider),
            const VocationCard(vocation: Vocation.wizard),
            Center(
              child: StyledButton(
                onPressed: submitHandler,
                child: StyledHeading('create character'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
