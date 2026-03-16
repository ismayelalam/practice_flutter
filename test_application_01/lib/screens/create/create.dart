import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_application_01/models/character.dart';
import 'package:test_application_01/models/vocation.dart';
import 'package:test_application_01/screens/create/vocation_card.dart';
import 'package:test_application_01/screens/home/home.dart';
import 'package:test_application_01/services/character_store.dart';
import 'package:test_application_01/shared/styled_button.dart';
import 'package:test_application_01/shared/styled_text.dart';
import 'package:test_application_01/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateState();
}

class _CreateState extends State<CreateScreen> {
  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

  Vocation selectedVocation = Vocation.junkie;

  void updateVocation(Vocation vocation) {
    setState(() {
      selectedVocation = vocation;
    });
  }

  void submitHandler() {
    if (_nameController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: StyledHeading("Missing Name"),
            content: StyledText("Every good RGP character need a unique name."),
            actions: [
              StyledButton(
                onPressed: () => Navigator.pop(ctx),
                child: const StyledHeading("close"),
              ),
            ],
            actionsAlignment: MainAxisAlignment.center,
          );
        },
      );
      return;
    }
    if (_sloganController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: StyledHeading("Missing Slogan"),
            content: StyledText(
              "Every good RGP character need a unique slogan.",
            ),
            actions: [
              StyledButton(
                onPressed: () => Navigator.pop(ctx),
                child: const StyledHeading("close"),
              ),
            ],
            actionsAlignment: MainAxisAlignment.center,
          );
        },
      );
      return;
    }

    Provider.of<CharacterStore>(context, listen: false).addCharacter(
      Character(
        name: _nameController.text.trim(),
        slogan: _sloganController.text.trim(),
        vocation: selectedVocation,
        id: uuid.v4(),
      ),
    );

    Navigator.push(context, MaterialPageRoute(builder: (ctx) => const Home()));
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
        child: SingleChildScrollView(
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
              const SizedBox(height: 40),

              const Center(child: StyledHeading("choose a vocation")),
              const SizedBox(height: 20),
              VocationCard(
                vocation: Vocation.junkie,
                onTap: updateVocation,
                selected: selectedVocation == Vocation.junkie,
              ),
              VocationCard(
                vocation: Vocation.ninja,
                selected: selectedVocation == Vocation.ninja,
                onTap: updateVocation,
              ),
              VocationCard(
                vocation: Vocation.raider,
                selected: selectedVocation == Vocation.raider,
                onTap: updateVocation,
              ),
              VocationCard(
                vocation: Vocation.wizard,
                selected: selectedVocation == Vocation.wizard,
                onTap: updateVocation,
              ),

              Center(
                child: StyledButton(
                  onPressed: submitHandler,
                  child: StyledHeading('create character'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
