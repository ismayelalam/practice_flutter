import 'package:flutter/material.dart';
import 'package:test_application_01/models/character.dart';
import 'package:test_application_01/models/skills.dart';
import 'package:test_application_01/shared/styled_text.dart';
import 'package:test_application_01/theme.dart';

class SkillList extends StatefulWidget {
  const SkillList(this.character, {super.key});

  final Character character;

  @override
  State<SkillList> createState() => _SkillListState();
}

class _SkillListState extends State<SkillList> {
  late List<Skill> availableSkill;
  late Skill selectedSkill;

  @override
  void initState() {
    availableSkill = allSkills.where((skill) {
      return skill.vocation == widget.character.vocation;
    }).toList();

    if (widget.character.skills.isEmpty) {
      selectedSkill = availableSkill[0];
    } else if (widget.character.skills.isNotEmpty) {
      selectedSkill = widget.character.skills.first;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        padding: EdgeInsets.all(16),
        color: AppColors.secondaryColor.withValues(alpha: 0.5),
        child: Column(
          children: [
            const StyledHeading("Choose an active skill."),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: availableSkill
                  .map(
                    (skill) => Container(
                      margin: const EdgeInsets.all(3),
                      padding: const EdgeInsets.all(2),
                      color: selectedSkill == skill
                          ? Colors.yellow
                          : Colors.transparent,
                      child: GestureDetector(
                        onTap: () => setState(() {
                          widget.character.updateSkill(skill);
                          selectedSkill = skill;
                        }),
                        child: Image.asset(
                          'assets/img/skills/${skill.image}',
                          width: 70,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 10),
            StyledText(selectedSkill.name),
          ],
        ),
      ),
    );
  }
}
