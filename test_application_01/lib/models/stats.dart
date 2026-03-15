mixin Stats {
  int _points = 10;
  int _health = 10;
  int _attach = 10;
  int _defense = 10;
  int _skill = 10;

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
