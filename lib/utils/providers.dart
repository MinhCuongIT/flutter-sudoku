import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sudoku3/providers/history_provider.dart';

import '../providers/help_provider.dart';
import '../providers/game_provider.dart';
import '../providers/settings_provider.dart';
import '../providers/search_provider.dart';

///Reset providers
void resetAll(WidgetRef ref) {
  final _help = ref.read(helpProvider.notifier);
  final _history = ref.read(historyProvider.notifier);
  final _match = ref.read(gameProvider.notifier);
  final _settings = ref.read(settingsProvider.notifier);
  final _search = ref.read(searchProvider.notifier);

  _help.reset();
  _match.reset();
  _history.reset();
  _settings.reset();
  _search.reset();
}
