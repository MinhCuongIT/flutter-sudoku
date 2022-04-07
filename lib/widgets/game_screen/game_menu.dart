import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../animations/reset_dialog.dart';
import '../../animations/save_dialog.dart';

class GameMenu extends ConsumerWidget {
  final Function onStart;
  final Function onInfo;

  const GameMenu({Key? key, required this.onStart, required this.onInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _primaryColor = Theme.of(context).colorScheme.primary;

    return PopupMenuButton(
      itemBuilder: (_) => [
        //Item
        PopupMenuItem(
          child: ListTile(
            leading: const Icon(
              Icons.settings_suggest_outlined,
              color: Colors.redAccent,
            ),
            title: Text(
              AppLocalizations.of(context)!.new_,
              style: TextStyle(color: _primaryColor),
            ),
          ),
          onTap: () => Future.delayed(
            const Duration(seconds: 0),
            () => onStart(),
          ),
        ),

        //Item
        PopupMenuItem(
          child: ListTile(
            leading: const Icon(
              Icons.restart_alt,
              color: Colors.orangeAccent,
            ),
            title: Text(
              AppLocalizations.of(context)!.reset,
              style: TextStyle(color: _primaryColor),
            ),
          ),
          onTap: () => Future.delayed(
            const Duration(seconds: 0),
            () => resetDialog(context, ref),
          ),
        ),

        //Item
        PopupMenuItem(
          child: ListTile(
            leading: const Icon(
              Icons.save_alt,
              color: Colors.greenAccent,
            ),
            title: Text(
              AppLocalizations.of(context)!.save,
              style: TextStyle(color: _primaryColor),
            ),
          ),
          onTap: () => Future.delayed(
            const Duration(seconds: 0),
            () => saveDialog(context, ref),
          ),
        ),

        //Item
        const PopupMenuItem(child: Divider()),

        //Item
        PopupMenuItem(
          child: ListTile(
            leading: Icon(
              Icons.info_outline,
              color: _primaryColor,
            ),
            title: Text(
              AppLocalizations.of(context)!.about,
              style: TextStyle(color: _primaryColor),
            ),
          ),
          onTap: () => Future.delayed(
            const Duration(seconds: 0),
            () => onInfo(),
          ),
        ),
      ],
    );
  }
}
