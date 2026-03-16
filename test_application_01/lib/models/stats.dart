mixin Stats {
  int _points = 10;
  int _health = 10;
  int _attach = 10;
  int _defense = 10;
  int _skill = 10;

  int get points => _points;

  Map<String, int> get statsAsMap => {
    "health": _health,
    "attach": _attach,
    "defense": _defense,
    "skill": _skill,
  };

  List<Map<String, String>> get statsAsList => [
    {"title": "health", 'value': _health.toString()},
    {"title": "attach", 'value': _attach.toString()},
    {"title": "defense", 'value': _defense.toString()},
    {"title": "skill", 'value': _skill.toString()},
  ];

  void increaseStat(String stat) {
    if (_points > 0) {
      switch (stat) {
        case "health":
          _health++;
          break;
        case "attach":
          _attach++;
          break;
        case "defense":
          _defense++;
          break;
        case "skill":
          _skill++;
          break;
        default:
      }
      _points--;
    }
  }

  void decreaseStat(String stat) {
    switch (stat) {
      case "health":
        if (_health > 5) {
          _health--;
          _points++;
        }
        break;
      case "attach":
        if (_attach > 5) {
          _attach--;
          _points++;
        }
        break;
      case "defense":
        if (_defense > 5) {
          _defense--;
          _points++;
        }
        break;
      case "skill":
        if (_skill > 5) {
          _skill--;
          _points++;
        }
        break;
      default:
    }
  }
}
