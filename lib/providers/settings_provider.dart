import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/settings_model.dart';

final settingsProvider = StateNotifierProvider<SettingsNotifier, SettingsModel>(
    (ref) => SettingsNotifier());

class SettingsNotifier extends StateNotifier<SettingsModel> {
  SettingsNotifier() : super(SettingsModel());

  final int _defaultValue = -1;

  ///Check if settings provider values are setted
  bool isValid() {
    if (state.type != _defaultValue && state.difficulty != _defaultValue) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    state = SettingsModel(
      type: _defaultValue,
      difficulty: _defaultValue,
    );
  }

  void setDifficulty(int value) {
    state = SettingsModel(
      type: state.type,
      difficulty: value,
    );
  }

  void setType(int value) {
    state = SettingsModel(
      type: value,
      difficulty: state.difficulty,
    );
  }

  int get defValue {
    return _defaultValue;
  }

  SettingsModel get options {
    return state;
  }
}
