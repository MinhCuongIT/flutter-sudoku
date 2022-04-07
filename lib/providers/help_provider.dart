import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'game_provider.dart';

final helpProvider = StateNotifierProvider<HelpNotifier, int>(
  (ref) => HelpNotifier(),
);

class HelpNotifier extends StateNotifier<int> {
  HelpNotifier() : super(-1);

  ///Fill a random available box on the grid
  void getHelp(WidgetRef ref) {
    final _gameNotifier = ref.read(gameProvider.notifier);
    final _values = [..._gameNotifier.game.temp].asMap();
    final _indexList = [];
    final _rnd = Random();
    int _index;

    //Create a list of all available index
    _values.forEach((key, value) {
      value == 0 ? _indexList.add(key) : null;
    });
    //Get a random value from list
    _index = _indexList[_rnd.nextInt(_indexList.length)];
    state = _index;
    //Set game provider index for show the box on the grid
    _gameNotifier.setIndex(_index);
    //Update game
    _gameNotifier.update(_gameNotifier.game.match[_index], ref);
  }

  void reset() {
    state = -1;
  }
}
