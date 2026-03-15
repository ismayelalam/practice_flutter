import 'package:test_application_01/models/skills.dart';
import 'package:test_application_01/models/stats.dart';
import 'package:test_application_01/models/vocation.dart';

class Character with Stats {
  final String name;
  final String slogan;
  final String id;
  final Set<Skill> skills = {};
  final Vocation vocation;
  bool _isFav = false;

  Character({
    required this.id,
    required this.name,
    required this.slogan,
    required this.vocation,
  });

  bool get isFav => _isFav;

  void toggleIsFav() {
    _isFav = !_isFav;
  }

  void updateSkill(Skill skill) {
    skills.clear();
    skills.add(skill);
  }
}

// dummy character data

List<Character> characters = [
  Character(
    id: '1',
    name: 'Klara',
    vocation: Vocation.wizard,
    slogan: 'Kapumf!',
  ),
  Character(
    id: '2',
    name: 'Jonny',
    vocation: Vocation.junkie,
    slogan: 'Light me up...',
  ),
  Character(
    id: '3',
    name: 'Crimson',
    vocation: Vocation.raider,
    slogan: 'Fire in the hole!',
  ),
  Character(
    id: '4',
    name: 'Shaun',
    vocation: Vocation.ninja,
    slogan: 'Alright then gang.',
  ),
];
