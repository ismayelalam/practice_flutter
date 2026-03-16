import 'package:flutter/material.dart';
import 'package:test_application_01/models/character.dart';
import 'package:test_application_01/screens/profile/skill_list.dart';
import 'package:test_application_01/screens/profile/stats_table.dart';
import 'package:test_application_01/shared/styled_button.dart';
import 'package:test_application_01/shared/styled_text.dart';
import 'package:test_application_01/theme.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: StyledTitle(character.name), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              color: AppColors.secondaryColor.withValues(alpha: 0.4),
              child: Row(
                children: [
                  Image.asset(
                    'assets/img/vocations/${character.vocation.image}',
                    width: 140,
                    height: 140,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StyledHeading(character.vocation.title),
                        StyledText(character.vocation.description),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
            Padding(
              padding: const EdgeInsetsGeometry.all(16),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                color: AppColors.secondaryColor.withValues(alpha: 0.6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const StyledHeading("Slogan"),
                    StyledText(character.slogan),
                    const SizedBox(height: 10),
                    const StyledHeading("Weapon"),
                    StyledText(character.vocation.weapon),
                    const SizedBox(height: 10),
                    const StyledHeading("Unique ability"),
                    StyledText(character.vocation.ability),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),

            Container(
              alignment: Alignment.center,
              child: Column(
                children: [StatsTable(character), SkillList(character)],
              ),
            ),
            Center(
              child: StyledButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const StyledHeading("Character was saved"),
                      showCloseIcon: true,
                      duration: const Duration(seconds: 2),
                      backgroundColor: AppColors.secondaryColor,
                    ),
                  );
                },
                child: StyledHeading('Save character'),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
