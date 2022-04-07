import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/game_model.dart';

final historyProvider = StateNotifierProvider<HistoryNotifier, List<GameModel>>(
    (ref) => HistoryNotifier());

class HistoryNotifier extends StateNotifier<List<GameModel>> {
  HistoryNotifier() : super([]);

  void addHistory(GameModel value) {
    final _history = [...state];

    _history.add(value);
    state = _history;
  }

  void deleteHistory() {
    final _history = [...state];

    _history.removeLast();
    state = _history;
  }

  void reset() {
    state = [];
  }

  List<GameModel> get history {
    return state;
  }

  GameModel get lastHistory {
    return state.last;
  }
}
