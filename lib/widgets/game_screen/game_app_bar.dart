import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../animations/warning_dialog.dart';
import '../../providers/history_provider.dart';
import '../about_dialog.dart';
import './help_btn.dart';
import './game_menu.dart';
import './undo_btn.dart';

class GameAppBar extends ConsumerWidget {
  const GameAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _historyProvider = ref.watch(historyProvider);

    return AppBar(
      title: Text(
        AppLocalizations.of(context)!.appName,
        style: Theme.of(context).textTheme.headline2,
      ),
      actions: [
        _historyProvider.isNotEmpty ? const UndoBtn() : const Text(''),
        const HelpBtn(),
        GameMenu(
          onStart: () => warningDialog(context),
          onInfo: () => aboutDialog(context),
        ),
      ],
    );
  }
}
