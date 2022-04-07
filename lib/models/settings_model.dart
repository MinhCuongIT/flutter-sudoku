class SettingsModel {
  int type;
  int difficulty;

  SettingsModel({
    this.type = -1,
    this.difficulty = -1,
  });

  @override
  String toString() => 'TYPE: $type, DIFFICULTY: $difficulty';
}
