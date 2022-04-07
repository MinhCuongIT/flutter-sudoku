import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:collection/collection.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../animations/error_dialog.dart';
import '../animations/win_dialog.dart';
import '../data/constants.dart';
import '../data/difficulty_easy.dart';
import '../data/difficulty_hard.dart';
import '../data/difficulty_medium.dart';
import '../data/difficulty_ultra.dart';
import '../models/game_model.dart';
import '../models/settings_model.dart';
import '../screens/game_screen.dart';
import '../utils/enum.dart';
import './settings_provider.dart';
import './history_provider.dart';

final gameProvider = StateNotifierProvider<GameNotifier, GameModel>(
  (ref) => GameNotifier(),
);

class GameNotifier extends StateNotifier<GameModel> {
  GameNotifier() : super(const GameModel());

  ///Check if the match list and temp list are equals and show dialogs
  void check(BuildContext context, WidgetRef ref, VoidCallback loadAd,
      VoidCallback showAd) async {
    final _check = const ListEquality().equals(state.match, state.temp);

    !state.temp.contains(0)
        ? _check
            ? winDialog(context, loadAd, showAd)
            : errorDialog(context, ref)
        : null;
  }

  ///Load shared preferences
  void load(BuildContext context, SharedPreferences prefs,
      SettingsNotifier optionsNotifier) {
    final _matchSaved = GameModel(
      id: prefs.getInt(Constants.id)!,
      type: prefs.getInt(Constants.type)!,
      difficulty: prefs.getString(Constants.difficulty)!,
      match: prefs
          .getStringList(Constants.match)!
          .map((e) => int.parse(e))
          .toList(),
      mask: prefs
          .getStringList(Constants.mask)!
          .map((e) => int.parse(e))
          .toList(),
      temp: prefs
          .getStringList(Constants.temp)!
          .map((e) => int.parse(e))
          .toList(),
    );

    setSavedMatch(_matchSaved, optionsNotifier);
    //Navigate to match screen
    Navigator.of(context).pushNamed(GameScreen.route);
  }

  void reset() {
    state = GameModel(
      id: state.id,
      type: state.type,
      difficulty: state.difficulty,
      match: state.match,
      mask: state.mask,
      temp: state.mask,
    );
  }

  ///Get the game from id and set game provider
  void searchById(SettingsNotifier optionsNotifier, int id) {
    final _difficultyCheck = id.toString()[0];
    List<Map<dynamic, Object>> _difficulty;
    Map<dynamic, Object> _match;

    //Get dificulty from match id
    switch (_difficultyCheck) {
      case '1':
        _difficulty = DifficultyEasy.easy;
        break;
      case '2':
        _difficulty = DifficultyMedium.medium;
        break;
      case '3':
        _difficulty = DifficultyHard.hard;
        break;
      case '4':
        _difficulty = DifficultyUltra.ultra;
        break;
      default:
        _difficulty = [];
    }
    _match = _difficulty.where((e) => e[Constants.id] == id).toList().first;
    state = GameModel(
      id: _match[Constants.id] as int,
      type: optionsNotifier.options.type,
      difficulty: _match[Constants.difficulty] as String,
      match: _match[Constants.match] as List<int>,
      mask: _match[Constants.mask] as List<int>,
      temp: _match[Constants.mask] as List<int>,
    );
  }

  ///Set index selected
  void setIndex(int index) {
    state = GameModel(
      id: state.id,
      type: state.type,
      difficulty: state.difficulty,
      match: state.match,
      mask: state.mask,
      temp: state.temp,
      index: index,
    );
  }

  ///Set new random match
  void setNewMatch(SettingsModel options) async {
    final _rnd = Random();
    final _difficulty = options.difficulty;
    List<Map<dynamic, Object>> _matchList;
    Map<dynamic, Object> _match;

    if (Difficulty.easy.index == _difficulty) {
      _matchList = DifficultyEasy.easy;
    } else if (Difficulty.medium.index == _difficulty) {
      _matchList = DifficultyMedium.medium;
    } else if (Difficulty.hard.index == _difficulty) {
      _matchList = DifficultyHard.hard;
    } else if (Difficulty.ultra.index == _difficulty) {
      _matchList = DifficultyUltra.ultra;
    } else {
      _matchList = [];
    }
    _match = _matchList[_rnd.nextInt(DifficultyEasy.easy.length)];
    state = GameModel(
      id: _match[Constants.id] as int,
      type: options.type,
      difficulty: _match[Constants.difficulty] as String,
      match: _match[Constants.match] as List<int>,
      mask: _match[Constants.mask] as List<int>,
      temp: _match[Constants.mask] as List<int>,
    );
  }

  ///Set game provider from shared preferences
  void setSavedMatch(GameModel game, SettingsNotifier optionsNotifier) {
    optionsNotifier.setType(game.type);
    optionsNotifier.setDifficulty(Difficulty.values
        .indexWhere((e) => enumToString(e) == game.difficulty));
    state = GameModel(
      id: game.id,
      type: optionsNotifier.options.type,
      difficulty: game.difficulty,
      match: game.match,
      mask: game.mask,
      temp: game.temp,
    );
  }

  ///Undo last action
  void undo(WidgetRef ref) {
    final _historyNotifier = ref.read(historyProvider.notifier);
    GameModel _lastGame;

    //If only one actions available clear the last box
    if (_historyNotifier.history.length == 1) {
      update(0, ref);
      _historyNotifier.reset();
    } else {
      //Remove last action
      _historyNotifier.deleteHistory();
      //Call last game status and update game provider
      _lastGame = _historyNotifier.lastHistory;
      state = GameModel(
        id: _lastGame.id,
        type: _lastGame.type,
        difficulty: _lastGame.difficulty,
        match: _lastGame.match,
        mask: _lastGame.mask,
        temp: _lastGame.temp,
        index: _lastGame.index,
      );
    }
  }

  ///Update game provider and
  void update(int value, WidgetRef ref) {
    final _historyNotifier = ref.read(historyProvider.notifier);
    final _temp = [...state.temp];

    if (value == 0 && _temp[state.index] == 0) {
      return;
    } else {
      _temp[state.index] = value;
      state = GameModel(
        id: state.id,
        type: state.type,
        difficulty: state.difficulty,
        match: state.match,
        mask: state.mask,
        temp: _temp,
        index: state.index,
      );
      //Update history
      _historyNotifier.addHistory(state);
    }
  }

  GameModel get game {
    return state;
  }
}
