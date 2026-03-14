import 'package:flutter/material.dart';
import 'package:test_application_01/shared/styled_text.dart';
import 'package:test_application_01/theme.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard(this.character, {super.key});

  final String character;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[800],
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            StyledText(character),
            Expanded(child: SizedBox()),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_forward, color: AppColors.textColor),
            ),
          ],
        ),
      ),
    );
  }
}
