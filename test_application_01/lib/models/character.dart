class Character {
  final String name;
  final String slogan;
  final String id;
  bool _isFav = false;

  Character({required this.name, required this.slogan, required this.id});

  void toggleIsFav() {
    _isFav = !_isFav;
  }
}
