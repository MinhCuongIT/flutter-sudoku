class GameModel {
  final int id;
  final int type;
  final String difficulty;
  final List<int> mask;
  final List<int> match;
  final List<int> temp;
  final int index;

  const GameModel({
    this.id = 0,
    this.type = -1,
    this.difficulty = '',
    this.mask = const [],
    this.match = const [],
    this.temp = const [],
    this.index = -1,
  });

  @override
  String toString() =>
      'ID: $id, TYPE: $type, DIFFICULTY: $difficulty, MASK: $mask, MATCH: $match, TEMP: $temp, INDEX: $index';
}
