import 'package:flutter/material.dart';
import 'package:test_application_01/models/vocation.dart';
import 'package:test_application_01/shared/styled_text.dart';
import 'package:test_application_01/theme.dart';

class VocationCard extends StatelessWidget {
  const VocationCard({super.key, required this.vocation});

  final Vocation vocation;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.secondaryColor,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Image.asset(
              'assets/img/vocations/${vocation.image}',
              width: 80,
              colorBlendMode: BlendMode.color,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StyledHeading(vocation.title),
                  StyledText(vocation.description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
