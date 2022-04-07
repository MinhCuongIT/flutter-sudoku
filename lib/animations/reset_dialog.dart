import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sudoku3/providers/help_provider.dart';
import 'package:sudoku3/providers/history_provider.dart';

import '../providers/game_provider.dart';

Future<AwesomeDialog> resetDialog(BuildContext context, WidgetRef ref) async {
  final _helpNotifier = ref.read(helpProvider.notifier);
  final _historyNotifier = ref.read(historyProvider.notifier);
  final _gameNotifier = ref.read(gameProvider.notifier);

  return AwesomeDialog(
    context: context,
    aligment: Alignment.center,
    animType: AnimType.TOPSLIDE,
    borderSide: const BorderSide(color: Colors.orangeAccent, width: 3),
    buttonsBorderRadius: const BorderRadius.all(Radius.circular(2)),
    dialogType: DialogType.WARNING,
    headerAnimationLoop: false,
    padding: const EdgeInsets.all(10),
    title: AppLocalizations.of(context)!.restartMatch,
    showCloseIcon: false,
    dismissOnBackKeyPress: false,
    dismissOnTouchOutside: false,
    btnCancel: ElevatedButton(
      onPressed: () => Navigator.of(context).pop(),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: Colors.white,
        side: const BorderSide(width: 1, color: Colors.orangeAccent),
      ),
      child: Text(
        AppLocalizations.of(context)!.no.toUpperCase(),
        style: const TextStyle(color: Colors.orangeAccent),
      ),
    ),
    btnOk: ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop();
        _helpNotifier.reset();
        _gameNotifier.reset();
        _historyNotifier.reset();
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: Colors.orangeAccent,
        side: const BorderSide(width: 1, color: Colors.orangeAccent),
      ),
      child: Text(
        AppLocalizations.of(context)!.yes.toUpperCase(),
        style: const TextStyle(color: Colors.white),
      ),
    ),
  )..show();
}
