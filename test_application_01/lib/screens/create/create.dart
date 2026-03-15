import 'package:flutter/material.dart';
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
          ],
        ),
      ),
    );
  }
}
