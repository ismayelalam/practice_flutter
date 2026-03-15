import 'package:test_application_01/models/stats.dart';
import 'package:test_application_01/models/vocation.dart';

class Character with Stats {
  final String name;
  final String slogan;
  final String id;
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
}
